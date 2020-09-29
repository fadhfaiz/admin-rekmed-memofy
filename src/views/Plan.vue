<template>
  <div class="plan">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->

      <h2 class="my-3 font-weight-bold">Form Plan</h2>

    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'

export default {
  name: 'plan',
  components: {
    SidebarNav
  }
}
</script>

<style>

</style>
