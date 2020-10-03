<!-- eslint-disable -->
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
      <form @submit="onSubmit">
        <div class="form-row">
          <div class="form-group col-md-6">
            <label>Nama Pasien</label>
            <input type="text" class="form-control" v-model="pasien.nama" required>
          </div>
          <div class="form-group col-md-6">
            <label>NIK</label>
            <input type="text" class="form-control" v-model="pasien.NIK" required>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label>Nomor HP</label>
            <input type="text" class="form-control" v-model="pasien.no_telp" required="">
          </div>
          <div class="form-group col-md-6">
            <label>Jenis Kelamin</label>
            <select v-model="pasien.jenis_kelamin" class="form-control">
              <option v-for="option in options">{{ option.text }}</option>
            </select>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label>Tanggal Lahir</label>
            <input type="date" class="form-control" v-model="pasien.tanggal_lahir" required>
          </div>
          <div class="form-group col-md-6">
            <label>Alamat</label>
            <input type="text" class="form-control" v-model="pasien.alamat" required>
          </div>
        </div>
          <button type="submit" class="btn btn-success mt-2" style="float: right; width: 20%;">Daftar</button>
          <button type="reset" class="btn btn-warning mr-3 mt-2" style="float: right;">Reset</button>
      </form>
    </div>
  </div>
</template>

<script>
/*eslint-disable*/
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
import InfoData from '@/components/InfoData.vue'
import { mapActions } from 'vuex'

export default {
  name: 'pendaftaran',
  components: {
    SidebarNav,
    InfoData
  },
  data () {
    return {
      options : [
        { text : 'Laki-Laki', value : 'Laki-Laki' },
        { text : 'Perempuan', value : 'Perempuan' }
      ],
      pasien : {
        NIK: '',
        nama: '',
        jenis_kelamin: '',
        tanggal_lahir: '',
        no_telp: '',
        alamat: ''
      },
      list_antrian : { nama : '', ID_pasien : '', status : ''},
    }
  },
  methods : {
    ...mapActions(['tambahDataPasien']),
    async saveData() {
      return await axios.post('http://localhost/rekmed-server/api/v1/Registrasi/post', this.pasien).then(res => res.data.pasien)
    },
    async onSubmit(e) {
      e.preventDefault();
      const pasiens = {
        NIK: this.pasien.NIK,
        nama: this.pasien.nama,
        jenis_kelamin: this.pasien.jenis_kelamin,
        tanggal_lahir: this.pasien.tanggal_lahir,
        no_telp: this.pasien.no_telp,
        alamat: this.pasien.alamat,
      }
      this.tambahDataPasien(pasiens);

      let p = await this.saveData()
      this.list_antrian.nama = p.nama
      this.list_antrian.ID_pasien = p.ID_pasien
      this.list_antrian.status = "Mengantri"

      let antrian = [...this.$store.state.list_antrian]

      antrian.push(this.list_antrian)

      this.$store.dispatch('tambahListAntrian', antrian)

      this.$router.push('/');
    }
  }
}

</script>

<style>

</style>
