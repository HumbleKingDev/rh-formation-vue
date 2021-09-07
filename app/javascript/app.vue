<template>
  <div id="app">
    <v-app>
      <p>{{ message }}</p>
      <user/>
      <appfooter/>
    </v-app>
  </div>
</template>

<script>
import user from "./packs/components/user.vue";
import appfooter from './packs/components/appfooter'
export default {
  data: function() {
    return {
      message: "Users List!"
    };
  },
  components: {
    user: user,
    appfooter: appfooter
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>