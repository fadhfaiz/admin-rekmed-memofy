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
        <div class="form-inline mb-4">
          <input type="text" class="form-control mr-3 w-75" id="cari_data_pasien" placeholder="Keluhan pasien">
          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah data <i
                class="fa fa-plus-circle"></i></button></router-link>
        </div>

        <div class="card" id="subjektif-page">
          <div class="card-header">
            <i style="float: left;" class="fa fa-id-card"></i>
          </div>
          <div class="card-body">
            <div class="card" style="width: 24rem;">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Demam<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                <li class="list-group-item">Stress<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                <li class="list-group-item">Batuk tak berdahak<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                <li class="list-group-item">Galau sepanjang hari<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;" class="fa fa-times"></i></button></span></li>
              </ul>
            </div>
          </div>
        </div>

      </form>

      <!-- Modal Hapus -->
      <div class="modal fade" id="hapus_subjektif" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Hapus Keluhan</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-danger">
              Yakin nih mau hapus aku?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-dark">Hapus</button>
            </div>
          </div>
        </div>
      </div>
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
#subjektif-page {
  overflow-y: scroll;
  height: 400px;
}
</style>
