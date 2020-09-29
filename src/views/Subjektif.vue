<template>
  <div class="subjektif">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->

      <h2 class="my-3 font-weight-bold">Form Subjektif</h2>

      <form>
        <div class="form-inline mb-3">
          <input type="text" class="form-control mr-3 w-75" id="cari_data_pasien" placeholder="Keluhan pasien">
          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah data <i
                class="fa fa-plus-circle"></i></button></router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'

export default {
  name: 'subjektif',
  components: {
    SidebarNav
  }
}

</script>

<style>

</style>
