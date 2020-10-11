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
          <input type="text" class="form-control mr-2" style="width: 54rem;" id="cari_data_pasien" placeholder="Cari data pasien" v-model="cariPasien">
          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah data <i class="fa fa-plus-circle"></i></button></router-link>
        </div>

        <table class="table table-hover table-bordered" v-if="cariPasien == ''">
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
              <td v-if="row.status == 'Antrian di proses'" class="text-center">
                <span>Sedang diproses </span>
                <button class="btn btn-danger btn-sm" type="button" @click="getPasienID(row.ID_pasien)" data-toggle="modal" data-target="#hapus_antrian">Hapus</button>
              </td>
              <td class="text-center" v-else>
                <button class="btn btn-info btn-sm mr-2" type="button" @click="getPasienID(row.ID_pasien)" data-toggle="modal" data-target="#proses_antrian">Proses</button>
                <button class="btn btn-danger btn-sm" type="button" @click="getPasienID(row.ID_pasien)" data-toggle="modal" data-target="#hapus_antrian">Hapus</button>
              </td>
            </tr>
          </tbody>
        </table>

        <table class="table table-hover table-bordered" style="width: 54rem;" v-else>
          <thead class="text-center">
            <th>NIK</th>
            <th>Nama Pasien</th>
            <th>No Telp</th>
            <th>Alamat</th>
            <th>Aksi</th>
          </thead>
          <tbody>
            <tr data-toggle="modal" data-target="#tambah_antrian" @click="getPasienID(pasien.ID, pasien.nama)" class="text-center" v-for="(pasien, index) in pasien_cocok" :key="index">
              <td>{{pasien.NIK}}</td>
              <td>{{pasien.nama}}</td>
              <td>{{pasien.no_telp}}</td>
              <td>{{pasien.alamat}}</td>
              <td>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tambah_antrian" @click="getPasienID(pasien.ID, pasien.nama)">Tambah</button>
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
              <button type="button" @click="proses_pasien()" data-dismiss="modal" class="btn btn-success">Proses</button>
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
              <button type="button" class="btn btn-danger" data-dismiss="modal" @click="hapusAntrianPasien()">Hapus</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal tambah antrian -->
      <div class="modal fade" id="tambah_antrian" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Tambah Antrian Pasien</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-success">
              Masukan data pasien ke antrian jir ?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-success" data-dismiss="modal" @click="tambahAntrianPasien()">Uye</button>
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
      list_antrian : [],
      ID_pasien : '',
      nama_pasien_antri: '',
      list_pasien: [],
      pasien_cocok: [],
      cariPasien: ''
    }
  },
  async created() {
    //localStorage.clear();
    this.tampilDataPasien()
    const parseData = (x) => {
      let y = localStorage.getItem(x);
      return JSON.parse(y) || [];
    } 
    this.list_antrian = this.$store.state.list_antrian
    this.list_antrian = parseData('list_antrian');
    this.list_pasien = await this.loadPasien();

    //console.log('pasien cocok', this.pasien_cocok)
    //console.log('list_pasien', this.list_pasien)
    console.log('list antrian dashboard',this.list_antrian)
  },
  watch : {
    cariPasien(val) {
      this.pasien_cocok = this.list_pasien.filter(res => {
        //console.log(res.nama == val)
        return res.nama.toLowerCase().search(val.toLowerCase()) != -1;
      });

      //console.log('ketemu', this.pasien_cocok)
    }
  },
  computed : mapGetters(['allPasien']),
  methods : {
    ...mapActions(['tampilDataPasien']),
    getPasienID(id, nama=null) {
      this.ID_pasien = id
      if(nama) this.nama_pasien_antri = nama;
    },
    async proses_pasien() {
      let pasien = await this.loadPasien(this.ID_pasien)
      if(pasien) {
          let proses_pasien = {
            'ID_pasien' : this.ID_pasien,
            'nama' : this.nama_pasien_antri,
            'status' : 'Antrian di proses'
          };

          this.list_antrian.push(proses_pasien);
          this.$store.dispatch('simpanDataPasien', pasien)
          localStorage.setItem('pasien', JSON.stringify(pasien));
          this.$router.push('/subjektif')
          console.log('proses pasien', this.list_antrian)
      }

    },
    async loadPasien(id = null) {
      if (id) {
        return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get/' + id).then(res => res.data)
      } else {
        return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get').then(res => res.data)
      }
    },
    async hapusAntrianPasien() {
      let list_view = [...this.list_antrian];
      this.list_antrian = list_view.filter(res => {
        return res.ID_pasien != this.ID_pasien
      });
      console.log('hapus', this.list_antrian)
      this.$store.dispatch('tambahListAntrian', this.list_antrian)
      localStorage.setItem('list_antrian', JSON.stringify(this.list_antrian));
    },
    tambahAntrianPasien() {
      let temp_list_antrian = {
          'ID_pasien': this.ID_pasien,
          'nama': this.nama_pasien_antri,
          'status': 'Menunggu'
      };

      let antrian = [...this.list_antrian];

      antrian.push(temp_list_antrian);

      this.$store.dispatch('tambahListAntrian', antrian);
      localStorage.setItem('list_antrian', JSON.stringify(antrian));

      this.list_antrian = [...antrian];
      console.log('list_antrian', this.list_antrian)

      this.cariPasien = '';
    }
  }
}

</script>

<style>

</style>
