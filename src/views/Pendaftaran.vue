<template>
  <div class="pendaftaran">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <InfoData />

      <!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <button type="button" id="sidebarCollapse" class="btn btn-info">
            <i class="fas fa-align-left"></i>
            <span>Toggle Sidebar</span>
          </button>
        </div>
      </nav> -->

      <h2 class="my-3 font-weight-bold">Pendaftaran Pasien Baru</h2>
      <form>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputEmail4">Nama Pasien</label>
            <input type="text" class="form-control" v-model="pasien.nama" required>
          </div>
          <div class="form-group col-md-6">
            <label for="inputPassword4">NIK</label>
            <input type="text" class="form-control" v-model="pasien.nik" required>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputCity">Nomor HP</label>
            <input type="text" class="form-control" v-model="pasien.no_hp" required="">
          </div>
          <div class="form-group col-md-6">
            <label for="inputState">Jenis Kelamin</label>
            <select id="jk_pasien" class="form-control">
              <option selected>Laki-Laki</option>
              <option>Perempuan</option>
            </select>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputEmail4">Tanggal Lahir</label>
            <input type="date" class="form-control" v-model="pasien.tgl_lahir" required>
          </div>
          <div class="form-group col-md-6">
            <label for="inputPassword4">Alamat</label>
            <input type="text" class="form-control" v-model="pasien.alamat_pasien" required>
          </div>
        </div>
          <router-link to="/anamnesis"><button type="submit" class="btn btn-success mt-2" style="float: right; width: 20%;" @click.prevent="simpan">Daftar</button></router-link>
          <button type="reset" class="btn btn-warning mr-3 mt-2" style="float: right;">Reset</button>
      </form>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
import InfoData from '@/components/InfoData.vue'

export default {
  name: 'pendaftaran',
  components: {
    SidebarNav,
    InfoData
  },
  data() {
    return {
      pasien : {
        nama_pasien : '',
        nik : '',
        no_hp : '',
        tgl_lahir : '',
        alamat_pasien : ''
      }
    }
  },
  methods : {

  }
}

</script>

<style>

</style>
