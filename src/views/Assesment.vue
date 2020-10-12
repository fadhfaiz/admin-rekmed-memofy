<!-- eslint-disable -->
<template>
  <div class="assesment">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->
      <!-- <h3>ID Pasien : {{ pasien_rekmed.ID }}  </h3>
      <h3>Nama Pasien : {{ pasien_rekmed.nama}}</h3> -->
      <h2 class="my-3 font-weight-bold">Form Assesment</h2>
      <div class="row">
        <div class="col-4">
          <div class="card border-left-danger shadow-none">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="text-md font-weight-bold text-danger text-uppercase">{{ pasien_rekmed.nama }}</div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-2">
          <div class="card border-left-danger shadow-none">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="text-md font-weight-bold text-danger text-uppercase">{{ pasien_rekmed.ID }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header font-weight-bold bg-dark text-white">
              Daftar Diagnosis
            </div>
            <div class="card-body">
              <div class="form-inline mb-4">
                <div class="row">
                  <div class="col-7">
                    <input type="text" th scope="col" style="width: 18rem;" class="form-control" id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="nama_diagnosis">
                    <!-- <input type="hidden" v-model="tambah_assesment.ID" > -->
                  </div>
                  <div class="col-5">
                    <button type="button" @click="onSubmit()" class="btn btn-block btn-success mx-2">Tambah data <i class="fa fa-plus-circle"></i></button>
                  </div>
                </div>
              </div>
              <div class="row" v-if="nama_diagnosis == ''">
                  <div class="col-12 my-3">
                  <div class="assesment_terpilih kiri">
                    <div class="card my-3" style="width: 25rem;">
                      <ul class="list-group list-group-flush" v-for="(row, index) in assesment_terpilih" v-bind:key="index">
                        <li class="list-group-item"><span>{{ row.nama_diagnosis }}<button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_assesment" @click="getIdAssesment(row.ID)"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                      </ul>
                    </div>
                  </div>
                  </div>
              </div>
              <!-- pencarian -->
              <div class="assesment_terpilih cari" style="width: 20rem" v-else>
              <table class="table table-hover table-bordered" style="width: 18rem;">
                <thead class="text-center">
                  <th>ID</th>
                  <th>Nama Diagnosis</th>
                  <th>Aksi</th>
                </thead>
                <tbody>
                  <tr class="text-center" v-for="(row, index) in assesment_cocok" v-bind:key="index">
                    <td>{{row.ID}}</td>
                    <td>{{row.nama_diagnosis}}</td>
                    <td>
                      <button class="btn btn-success btn-sm float-right" type="button" @click="onSubmitCari(row.ID, row.nama_diagnosis)"><i style="float: left;" class="fa fa-plus-circle"></i></button>
                    </td>
                  </tr>
                </tbody>
              </table>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card">
            <div class="card-header font-weight-bold bg-dark text-white">
              Assesment Terpopuler
            </div>
            <div class="card-body assesment_terpilih kanan">
            <!-- <div class="card my-3" style="width: 25rem;">
                      <ul class="list-group list-group-flush" v-for="(row, index) in tampil_assesment" :key="index">
                        <li class="list-group-item"><span>{{ row.nama_diagnosis }}<button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_assesment"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                      </ul>
                    </div> -->
            </div>
          </div>
        </div>
      </div>
      <div class="row">
          <div class="col">
            <button type="button" data-toggle="modal" data-target="#proses_assesment" @click="getIdPasien(pasien_rekmed.ID)" class="btn btn-warning mr-2" >Simpan dan lanjutkan <i
                class="fa fa-arrow-right"></i></button>
          </div>
      </div>
    </div>
    <!-- Modal Hapus -->
      <div class="modal fade" id="hapus_assesment" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Hapus Assesment</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-danger">
              Yakin ?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-dark" @click="hapusAssesment()" data-dismiss="modal">Hapus</button>
            </div>
          </div>
        </div>
      </div>
    <!-- Modal proses selanjutnya -->
      <div class="modal fade" id="proses_assesment" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">lanjut ke proses plan</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-success">
              Yakin nih mau proses selanjutnya ke plan ?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-success" @click="prosesAssesment()" data-dismiss="modal">Oke</button>
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
import { mapActions } from 'vuex'
import axios from 'axios'

export default {
  name: 'assesment',
  components: {
    SidebarNav
  },
  data() {
    return {
      nama_diagnosis : '',
      tampil_assesment : [],
      assesment_terpilih : [],
      pasien_rekmed : [],
      assesment_cocok : [],
      cari_assesment : ''
    }
  },
  async created() {
    const getData = (x) => {
      let y = localStorage.getItem(x);
      return JSON.parse(y) || [];
    }
    this.assesment_terpilih = getData('list_assesment');
    this.pasien_rekmed = getData('pasien');
    this.tampil_assesment = await this.tampilAssesment();
    
    console.log('pasien', this.pasien_rekmed)
    console.log('assesment', this.assesment_terpilih)
    console.log('tampil assesment', this.tampil_assesment)
  },
  watch : {
    nama_diagnosis(val) {
      this.assesment_cocok = this.tampil_assesment.filter(res => {
        return res.nama_diagnosis.toLowerCase().search(val.toLowerCase()) != -1;
      });

      //console.log('ketemu', this.assesment_cocok)
    }
  },
  methods : {
    //...mapActions(['tambahDataAssesment']),
    async tambahAssesment() {
      return await axios.post('http://localhost/rekmed-server/api/v1/Assesment/post',{
        nama_diagnosis : this.nama_diagnosis
      }).then(res => res.data.assesment)
    },
    async onSubmit() {
      this.tampil_assesment = await this.tambahAssesment()
      
        if(this.tampil_assesment) {   
        
          let temp_assesment = {
             'ID' : Math.random(),
             'ID_pasien' : this.pasien_rekmed.ID,
             'nama_diagnosis' : this.nama_diagnosis
          }
      
          this.assesment_terpilih.push(temp_assesment)
          this.nama_diagnosis = ''
        }

        this.$store.dispatch('tambahListAssesment', this.assesment_terpilih)
        localStorage.setItem('list_assesment', JSON.stringify(this.assesment_terpilih))
        console.log('assesment_terpilih', this.assesment_terpilih)
        console.log('assesment_nama', this.nama_diagnosis)
    },
    onSubmitCari(id, nama = null) {
       this.assesment_terpilih.ID = id
       if(nama) this.nama_diagnosis = nama ;
       
       let temp_assesment = {
             'ID' : Math.random(),
             'ID_pasien' : this.pasien_rekmed.ID,
             'nama_diagnosis' : this.nama_diagnosis
          }
      
          this.assesment_terpilih.push(temp_assesment)
          this.nama_diagnosis = ''
          this.$store.dispatch('tambahListAssesment', this.assesment_terpilih)
          localStorage.setItem('list_assesment', JSON.stringify(this.assesment_terpilih))
          console.log('assesment_terpilih cari', this.assesment_terpilih)
    },
    async tampilAssesment(id = null) {
      if (id) {
        return await axios.get('http://localhost/rekmed-server/api/v1/Assesment/get/' + id).then(res => res.data)

      } else {
        return await axios.get('http://localhost/rekmed-server/api/v1/Assesment/get').then(res => this.tampil_assesment = res.data)
        console.log('tampil_assesment', this.tampil_assesment)
      }
    },
    async loadPasien(id) {
      return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get/' + id).then(res => res.data)
    },
    async getIdAssesment(id) {
    this.assesment_terpilih.ID = id
    //console.log('id', id)
    //console.log('nama', nama)
    },
    getIdPasien(id) {
      this.pasien_rekmed.ID = id
    },
    async prosesAssesment() {
      let pasien = await this.loadPasien(this.pasien_rekmed.ID)
      if(pasien) {
        this.$store.dispatch('simpanDataPasien', pasien)
        localStorage.setItem('pasien', JSON.stringify(pasien));
        this.$router.push('/plan')
      }
      console.log('proses pasien',pasien)
    },
    async hapusAssesment() {
      let list_asses = [...this.assesment_terpilih];
      this.assesment_terpilih = list_asses.filter(res => {
        return res.ID != this.assesment_terpilih.ID
      });
      this.$store.dispatch('tambahListAssesment', this.assesment_terpilih)
      localStorage.setItem('list_assesment', JSON.stringify(this.assesment_terpilih))
      console.log('assesment_terpilih hapus', this.assesment_terpilih)
    }
  }
}

</script>

<style>
.assesment_terpilih {
  overflow-y: scroll;
}

.kanan {
height: 400px;
}

.kiri {
height: 299px;
}
.cari {
height: 150px;
}

</style>
