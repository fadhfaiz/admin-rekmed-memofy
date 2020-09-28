<template>
  <div class="laporan">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->

      <h2 class="my-3 font-weight-bold">Grafik Laporan Klinik</h2>

    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'

export default {
  name: 'laporan',
  components: {
    SidebarNav
  }
}
</script>

<style>

</style>
