# Logfile Analysis

Created 30-08-2024, last change 30-08-2024

## How to count stacktraces in a log file

The following Scala program StacktraceCounter.scala finds the log messages with (Java) stacktraces in the logfiles given
as arguments, groups them after removing irrelevant lines, and counts them. In the end they are printed out in order of
number of occurrences. You might have to customize the regular expressions for your log format, though.

```scala
#!/bin/sh
exec scala "$0" "$@"
!#

import java.io.File

import scala.collection.mutable.ArrayBuffer
import scala.io.Source

/** Counts the stacktraces in a logfile. The stacktraces are normalized, counted, sorted by descending frequency. */

object StacktraceCounter {

  def main(args: Array[String]) = {

    def isStackLine(line: String) = line.matches("""^\s+at .*|^Caused by: .*|^\S+... [0-9]+ more.*""")

    def isLogEntryStart(line: String) = //line.matches("""^(202[0-9]-[01]\d-[0-3]\d|[0-3]\d\.[01]\d\.202[0-9] ).*""")
      line.matches("""^\s*([0-9]{1,4}[-:., ]+){6,7}.*""") // rough but probably matches many formats

    // possibly also com.adobe|com.day.cq
    val uninterestingStackLines = ("""at java.lang.reflect|at org.apache.sling|at org.eclipse.jetty|at org.apache.jackrabbit|at org.apache.felix|at java.base/|org.quartz|org.apache.hc|at org.springframework|at \S+\$|at jdk.internal""").r

    def groupToLogMessages(lines: Iterator[String]) =
      new Iterator[List[String]] {
        private val it = lines.dropWhile(!isLogEntryStart(_)).buffered

        override def hasNext: Boolean = it.hasNext

        override def next(): List[String] = {
          val res = new ArrayBuffer[String]
          if (it.hasNext) {
            res += it.next()
            while (it.hasNext && !isLogEntryStart(it.head)) res += it.next()
          }
          res.toList
        }
      }

    val logmessages: Iterator[List[String]] = args.iterator.flatMap { arg =>
      val source = if ("-" == arg) Source.stdin else Source.fromFile(new File(arg.trim), "UTF-8")
      groupToLogMessages(source.getLines())
    }

    case class StacktraceInfo(heading: String, normalizedStacktrace: String)

    println("Filtering " + uninterestingStackLines)
    println()

    def normalize(trace: List[String]): StacktraceInfo = StacktraceInfo(
      trace.takeWhile(!isStackLine(_)).mkString("\n"),
      trace.filter(isStackLine).filterNot(uninterestingStackLines.findFirstIn(_).isDefined).mkString("\n").intern()
    )

    val groupedLogMessages = {
      val buf = logmessages.map(normalize).filterNot(_.normalizedStacktrace.isEmpty).toBuffer
      buf.groupBy(_.normalizedStacktrace)
    }

    groupedLogMessages.toList.sortBy(-_._2.size) foreach { case (normalizedTrace, threadGroup) =>
      println(threadGroup.size.formatted("==== %6d") + " ===============================================================")
      println(normalizedTrace)
      println("------------------")
      threadGroup foreach { thread =>
        println(thread.heading)
        println()
      }
    }

  }

}
```

## Slice a part out of a logfile (logfileSlice.sh)

Extracts the longest part of a logfile that contains a certain pattern. The pattern is given as a regular expression.
That is, it prints the first line that matches the pattern, and then all lines until the last line that matches the 
pattern.

```bash
#!/bin/bash
if [ $# -ne 2 ]; then
  cat >&2 <<EOF
Usage: $0 pattern file
This script slices out the longest part of a logfile that contains lines matching a pattern.
That is, it finds the first and last line matching the pattern, and all lines in between.
EOF
  exit 1
fi

pat=$1
fil=$2

start=`egrep -n "$pat" "$fil" | cut -d : -f 1 | sort -n | head -n 1`
end=`egrep -n "$pat" "$fil" | cut -d : -f 1 | sort -rn | head -n 1`
head -n "$end" "$fil" | tail -n "+$start"
```

## Slice a part out of a logfile with start and stop pattern (logfileSliceStartStop.scala)

```bash
#!/bin/bash
if [ $# -ne 3 ]; then
  cat >&2 <<EOF
Usage: $0 startpattern stoppattern file
Prints all lines of the file starting from the first line that matches startpattern
until the first line that matches stoppattern.
EOF
  exit 1
fi

startpat=$1
stoppat=$2
fil=$2

start=`egrep -n "$startpat" "$fil" | cut -d : -f 1 | sort -n | head -n 1`
end=`egrep -n "$stoppat" "$fil" | cut -d : -f 1 | sort -nr | head -n 1`
head -n "$end" "$fil" | tail -n "+$start"
```
