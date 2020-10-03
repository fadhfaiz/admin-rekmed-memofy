<!-- eslint-disable -->
<template>
  <div class="dashboard">
    <!-- Sidebar -->
    <SidebarNav/>

    <!-- Page Content -->
    <div id="content">

      <!-- InfoData -->
      <InfoData/>

      <h2 class="my-3 font-weight-bold">Daftar Antrian</h2>
      <form>
        <div class="form-inline mb-3">
          <input type="text" class="form-control mr-2" style="width: 54rem;" id="cari_data_pasien" placeholder="Cari data pasien">
          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah data <i class="fa fa-plus-circle"></i></button></router-link>
        </div>

        <table class="table table-hover table-bordered">
          <thead>
            <tr class="text-center bg-dark" style="color: white;">
              <th scope="col">Nomor Antrian</th>
              <th scope="col">Nama Pasien</th>
              <th scope="col">Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(row, index) in list_antrian" :key="index">
              <th scope="row" class="text-center">{{ index+1 }}</th>
              <td>{{ row.nama }}</td>
              <td class="text-center">
                <button class="btn btn-info btn-sm mr-2" type="button" @click="getPasienID(row.ID_pasien)" data-toggle="modal" data-target="#proses_antrian">Proses</button>
                <button class="btn btn-danger btn-sm" type="button" @click="getPasienID(row.ID_pasien)" data-toggle="modal" data-target="#hapus_antrian">Hapus</button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>

      <!-- Modal Proses -->
      <div class="modal fade" id="proses_antrian" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Proses Pasien</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-success">
              Pastikan pak dokter udah siap ya!
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" @click="proses_pasien()" class="btn btn-success">Proses</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal Hapus -->
      <div class="modal fade" id="hapus_antrian" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Hapus Antrian Pasien</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-danger">
              Yakin nih mau hapus aku?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-danger">Hapus</button>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
/*eslint-disable*/
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
import InfoData from '@/components/InfoData.vue'
import { mapActions, mapGetters } from 'vuex'
import axios from 'axios'

export default {
  name: 'dashboard',
  components: {
    SidebarNav,
    InfoData
  },
  data () {
    return {
      list_antrian : [
        { nama : '', ID_pasien : '', status : ''}
      ],
      ID_pasien : '',
    }
  },
  created() {
    this.tampilDataPasien()

    console.log(this.$store.state.list_antrian)
  },
  computed : mapGetters(['allPasien']),
  methods : {
    ...mapActions(['tampilDataPasien']),
    getPasienID(id) {
      this.ID_pasien = id
    },
    async proses_pasien() {
      let pasien = await this.loadPasien(this.ID_pasien)
      this.$store.dispatch('simpanDataPasien', pasien)
      this.$router.push({name : 'Rekam_Medis', params : {'ID' : pasien.ID_pasien}})

    },
    async loadPasien(id) {
      return await axios.get('http://localhost/rekmed-server/api/v1/Registrast/get/' + id).then(res => res.data)
    } 
  }
}

</script>

<style>

</style>
