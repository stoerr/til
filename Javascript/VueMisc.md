# Miscellaneous about Vue.js

Created 24-09-2024, last change 25-10-2024

Tutorial: https://vuejs.org/tutorial/

(Older) Options API, newer Composition API

## Compositions API:

- dynamically adapts template if variables with ref() change
- "moustache" syntax {{xxx}} calculating expressions
- dynamic attributes with v-bind:attrname="variable" , shorthand :attrname="variable"
- v-on:eventname="function" for event handling, shorthand @eventname="function"
- v-model="variable" stores input in variable and vice versa
- v-if="condition" to show/hide elements
- computed(function) to use calculated values
- const pElementRef = ref(null) + <p ref="pElementRef">Hello</p> to access elements as pElementRef.value
- watch(variable, function) to watch variables
- import ChildComp from './ChildComp.vue' and <ChildComp />
- const props = defineProps({msg: String}) properties of child component, use with attributes or v-bind <ChildComp 
  :msg="greeting" />
- messages child component to parent : defineEmits , v-on on parent
- slots: content of child element as used in parent : <slot/>
- references to components: create a ref() , add ref="thatref" to the component and use this.$refs.thatref
- export functions mit defineExpose({functionname}) to expose functions to parent for use with this.$refs
