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
      <form>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label>NIK</label>
            <input type="text" class="form-control" v-model="pasien.NIK" required>
          </div>
          <div class="form-group col-md-6">
            <label>Nama Pasien</label>
            <input type="text" class="form-control" v-model="pasien.nama" required>
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
              <option v-for="option in options" v-bind:key="option.value" :value="option.value">{{ option.text }}</option>
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
          <button type="button" class="btn btn-success mt-2" style="float: right; width: 20%;" @click="onSubmit()">Daftar</button>
          <button type="reset" class="btn btn-secondary mr-3 mt-2" style="float: right;">Reset</button>
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
import axios from "axios"

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
      list_antrian : {},
    }
  },
  methods : {
    ...mapActions(['tambahDataPasien']),
    async saveData() {
      return await axios.post('http://localhost/rekmed-server/Api/v1/Registrasi/post', this.pasien).then(res => res.data)
    },
    async onSubmit() {
      const pasiens = {
        NIK: this.pasien.NIK,
        nama: this.pasien.nama,
        jenis_kelamin: this.pasien.jenis_kelamin,
        tanggal_lahir: this.pasien.tanggal_lahir,
        no_telp: this.pasien.no_telp,
        alamat: this.pasien.alamat,
      }

      this.tambahDataPasien(pasiens);

      let p = await this.saveData().then(res => res.pasien);
      // console.log('ini p',p)
      if (p) {
        this.list_antrian.nama = p.nama
        this.list_antrian.ID_pasien = p.ID
        this.list_antrian.status = "Menunggu"

        let parseData = JSON.parse(localStorage.getItem('list_antrian')) || [];

        let antrian = parseData;

        console.log('parsedata',parseData)

        if(antrian == []) {
          antrian = [...this.$store.state.list_antrian];
          console.log('antrian',antrian)
        }
  
        antrian.push(this.list_antrian)
  
        this.$store.dispatch('tambahListAntrian', antrian)
        localStorage.setItem('list_antrian', JSON.stringify(antrian))
        this.$router.push('/');
      }

      // console.log(antrian)
      // e.preventDefault();

    }
  }

  // short hand
  // @ = v-on
  // : = v-bind

  // @click or @submit = v-on:click or v-on:submit
  // :key or :class = v-bind:key or v-bind:class
}

</script>

<style>
  
</style>
