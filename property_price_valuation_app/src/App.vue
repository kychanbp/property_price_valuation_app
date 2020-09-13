<template>
  <div id="app">
    <Valuation />
  </div>
</template>

<script>
import Valuation from './components/Valuation';

export default {
  name: 'App',
  components: {
    Valuation
  },
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
