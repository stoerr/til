# Some links / insights about AEM workflows

Created 03-08-2024, last change 03-08-2024

This is a pretty unsorted collection of stuff about AEM workflows, for my own use.

## Links

- https://medium.com/@jlanssie/create-a-custom-workflow-model-in-aem-with-a-full-code-coverage-unit-test-4178b2263b81
- https://medium.com/@jlanssie/translate-entires-websites-in-aem-automatically-with-openai-944875cbfa22
- https://experienceleague.adobe.com/en/docs/experience-manager-65/content/implementing/developing/extending-aem/extending-workflows/workflows

## Job details

http://localhost:5502/mnt/overlay/granite/async/content/asyncjobs/jobdetails.html?jobid=2024/7/10/8/46/27631c1d-47a2-4153-87ce-77d4c842ef52_610
reads the data e.g. from /var/eventing//
SELECT * FROM [nt:base] AS s WHERE ISDESCENDANTNODE([/var/eventing]) AND NAME(s) = '27631c1d-47a2-4153-87ce-77d4c842ef52_610'
->
/var/eventing/jobs/finished/com.adobe.cq.wcm.jobs.async.rollout/2024/7/10/8/46/27631c1d-47a2-4153-87ce-77d4c842ef52_610

## Workflow models

sling:resourceType="cq/workflow/components/pages/model"

Process step: execute action from service

https://experienceleague.adobe.com/en/docs/experience-manager-65/content/implementing/developing/extending-aem/extending-workflows/workflows-best-practices
-> do not start workflows from other workflows

List models http://localhost:5502/etc/workflow/models.json

## Other links

https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/workflow/WorkflowService.html
https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/wcm/msm/api/RolloutManager.html
