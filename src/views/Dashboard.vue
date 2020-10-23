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
              <tr v-for="(row, index) in list_antrian" v-bind:key="index">
                <th scope="row" class="text-center">{{ index+1 }}</th>
                <td>{{ row.nama }}</td>
                <td class="text-center" v-if="row.status=='Menunggu'">
                  <button class="btn btn-info btn-sm mr-2" type="button" @click="getPasienID(row.ID_pasien, row.nama, row.status)" data-toggle="modal" data-target="#proses_antrian">Proses</button>
                  <button class="btn btn-danger btn-sm" type="button" @click="getPasienID(row.ID_pasien)" data-toggle="modal" data-target="#hapus_antrian">Hapus</button>
                </td>
                <td class="text-center" v-if="row.status=='proses'">
                  <span>sedang proses </span>
                  <button class="btn btn-danger btn-sm" type="button" @click="getPasienID(row.ID_pasien)" data-toggle="modal" data-target="#hapus_antrian">X</button>

                </td>
              </tr>
              <!-- <tr v-for="(row, index) in list_antrian" v-bind:key="index" v-else>
                <th scope="row" class="text-center">{{ index+1 }}</th>
                <td>{{ row.nama }}</td>
                <td class="text-center">
                  <button class="btn btn-info btn-sm mr-2" type="button" @click="getPasienID(row.ID_pasien, row.nama, row.status)" data-toggle="modal" data-target="#proses_antrian">Proses</button>
                  <button class="btn btn-danger btn-sm" type="button" @click="getPasienID(row.ID_pasien)" data-toggle="modal" data-target="#hapus_antrian">Hapus</button>
                </td>
              </tr> -->
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
            <tr @click="tambahAntrianPasien(pasien.ID, pasien.nama)" class="text-center" v-for="(pasien, index) in pasien_cocok" v-bind:key="index">
              <td>{{pasien.NIK}}</td>
              <td>{{pasien.nama}}</td>
              <td>{{pasien.no_telp}}</td>
              <td>{{pasien.alamat}}</td>
              <td>
                  <button type="button" class="btn btn-primary" @click="tambahAntrianPasien(pasien.ID, pasien.nama)">Tambah</button>
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
            <div class="modal-body text-dark">
              Pastikan pak dokter udah siap ya!
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" @click="proses_pasien()" data-dismiss="modal" class="btn btn-info">OK</button>
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
            <div class="modal-body text-dark">
              Yakin nih mau hapus aku?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-danger" data-dismiss="modal" @click="hapusAntrianPasien()">Hapus</button>
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
      status : '',
      list_pasien: [],
      pasien_cocok: [],
      cariPasien: '',
      pasien_proses : []
    }
  },
  async created() {
    //localStorage.clear();
    this.tampilDataPasien()
    const parseData = (x) => {
      let y = localStorage.getItem(x);
      return JSON.parse(y) || [];
    } 
    //this.list_antrian = this.$store.state.list_antrian
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
        return res.nama.toLowerCase().search(val.toLowerCase()) != -1 || res.NIK.search(val) != -1;
      });

      //console.log('ketemu', this.pasien_cocok)
    }
  },
  computed : mapGetters(['allPasien']),
  methods : {
    ...mapActions(['tampilDataPasien']),
    getPasienID(id, nama=null, status=null) {
      this.ID_pasien = id
      if(nama) this.nama_pasien_antri = nama;
      if (status) this.status = status;

      //console.log(status)
    },
    async proses_pasien() {
      let pasien = await this.loadPasien(this.ID_pasien)
      //console.log('proses',pasien)
      let list_proses = [...this.list_antrian];
        this.list_antrian = list_proses.filter(res => {
             return res.ID_pasien != this.ID_pasien
        });
      if(pasien) {
          let proses_pasien = {
            'ID_pasien' : this.ID_pasien,
            'nama' : this.nama_pasien_antri,
            'status' : 'proses'
          };

          this.list_antrian.unshift(proses_pasien);
          this.$store.dispatch('tambahListAntrian', this.list_antrian)
          localStorage.setItem('list_antrian', JSON.stringify(this.list_antrian));

          this.$store.dispatch('simpanDataPasien', pasien)
          localStorage.setItem('pasien', JSON.stringify(pasien));

          console.log('proses', list_proses)
          console.log('proses hasil', this.list_antrian)
          this.$router.push('/SOAP')
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
    tambahAntrianPasien(id, nama = null) {
      this.ID_pasien = id
      if(nama) this.nama_pasien_antri = nama;
      let temp_list_antrian = {
          'ID_pasien': id,
          'nama': nama,
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
