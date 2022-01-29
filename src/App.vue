<template>
  <div id="app">
    <ol>
      <li v-for="weekNumber in 53" :key="weekNumber">
        <Week :weekNumber="weekNumber" />
      </li>
    </ol>
  </div>
</template>

<script>
import Week from './Week.vue'

export default {
  name: 'App',
  components: {
    Week
  }
}
</script>

<style>
 @font-face {
  font-family: "Mosbekke Sans";
  src: url("assets/MosbekkeSans-Regular.ttf");
}

@page {
  size: A4 landscape;
  margin: 0;
}

* {
  box-sizing: border-box;
}

body {
  padding: 0;
  margin: 0;
  width: 100vw;
  font-family: 'Mosbekke Sans';
}

h1, h2, h3 {
  margin: 0;
  font-size: 13pt;
}

#app {
  position: relative;
  width: 100%;
  height: 100%;
  opacity: 0.7;
}

ol {
  list-style-type: none;
}

ol, li {
  margin: 0;
  padding: 0;
}

li {
  padding: 1cm;
  height: 100vh;
}
</style>
