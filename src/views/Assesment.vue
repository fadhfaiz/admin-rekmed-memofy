<!-- eslint-disable -->
<template>
  <div class="assesment">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->
      <h3>ID Pasien : {{ pasien_rekmed.ID }}  </h3>
      <h3>Nama Pasien : {{ pasien_rekmed.nama}}</h3>
      <br>
      <h2 class="my-3 font-weight-bold">Form Assesment</h2>
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
                    <input type="text" th scope="col" style="width: 18rem;" class="form-control" id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="tambah_assesment.assesment">
                  </div>
                  <div class="col-5">
                    <button type="button" @click="tambahAssesment()" class="btn btn-block btn-success mx-2">Tambah data <i class="fa fa-plus-circle"></i></button>
                  </div>
                </div>
              </div>
              <!-- <div class="assesment_terpilih kiri">
                <table v-if="tambah_assesment.assesment != ''" class="table table-hover table-borderless">
                  <thead>
                    <tr class="text-center bg-light">
                      <th scope="col">ID</th>
                      <th scope="col" style="width: 20rem;">Diagnosis</th>
                      <th scope="col">Proses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="(row, index) in tampil_assesment" :key="index">
                      <th scope="row" class="text-center">P0{{ index+1 }}</th>
                      <td class="text-center">{{ row.assesment }}</td>
                      <td class="text-center">
                        <button class="btn btn-info btn-sm mr-2" type="button" data-toggle="modal"
                          data-target="#proses_antrian"><i style="float: left;" class="fa fa-arrow-right"></i></button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div> -->
              <div class="row">
                  <div class="col-12 my-3">
                    <table class="table table-hover">
                      <thead>
                        <tr class="text-center bg-dark" style="color: white">
                          <th scope="col">ID</th>
                          <th scope="col" style="width: 20rem;">Diagnosis</th>
                          <th scope="col">Proses</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="(row, index) in tampil_assesment" :key="index">
                          <th scope="row" class="text-center">P0{{ row.id }}</th>
                          <td class="text-center">{{ row.assesment }}</td>
                          <td class="text-center">
                            <button class="btn btn-info btn-sm mr-2" type="button" @click="assesmentTerpilih(row.id, row.assesment)"><i style="float: left;" class="fa fa-arrow-right"></i></button>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card">
            <div class="card-header font-weight-bold bg-dark text-white">
              Assesment Terpilih
            </div>
            <div class="card-body assesment_terpilih kanan">
              <div class="card" style="width: 29rem;">
                <ul class="list-group list-group-flush" v-for="(row, index) in assesment_terpilih" :key="index">
                  <li class="list-group-item"><span>{{ row.assesment }}<button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_assesment" @click="getIdAssesment(row.id)"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
          <div class="col">
            <button type="button" data-toggle="modal" data-target="#proses_assesment" @click="getIdPasien(pasien_rekmed.ID)" class="btn btn-block btn-success mr-2" >Simpan dan lanjutkan <i
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
              Yakin nih mau hapus aku?
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
      tambah_assesment : {
        assesment : ''
      },
      tampil_assesment : [],
      //rekmed_assesment : {},
      assesment_terpilih : [],
      pasien_rekmed : [],
      assesment_cocok : [],
      cari_assesment : ''
    }
  },
  created() {
    const pasienRekmed = (pasien) => {
      let y = localStorage.getItem('pasien');
      return JSON.parse(y) || [];
    }
    const assesTerpilih = (assesment) => {
      let ass = localStorage.getItem('assesment_terpilih');
      return JSON.parse(ass) || [];
    }
    this.assesment_terpilih = assesTerpilih('assesment_terpilih');
    this.pasien_rekmed = pasienRekmed('pasien_rekmed');
    
    console.log('pasien', this.pasien_rekmed)
    //console.log('assesment', this.rekmed_assesment)
  },
  mounted() {
    this.tampilAssesment()
    console.log('terpilih',this.assesment_terpilih)
  },
  watch : {
    /*cariAssesment(val) {
      this.assesment_cocok = this.rekmed_assesment.filter(res => {
        return res.assesment.toLowerCase().search(val.toLowerCase()) != -1;
      })
    }*/
  },
  methods : {
    ...mapActions(['tambahDataAssesment']),
    async tambahAssesment() {
      return await axios.post('http://localhost/rekmed-server/api/v1/Assesment/post',this.tambah_assesment).then(res => this.tambah_assesment = res.data)
      
        this.tambah_assesment.assesment = ''
        this.tampilAssesment() 
    },
    async tampilAssesment(id = null) {
      if (id) {
        return await axios.get('http://localhost/rekmed-server/api/v1/Assesment/get/' + id).then(res => this.tampil_assesment = res.data)

      } else {
        return await axios.get('http://localhost/rekmed-server/api/v1/Assesment/get').then(res => this.tampil_assesment = res.data)
      }
    },
    async loadPasien(id) {
      return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get/' + id).then(res => res.data)
    },
    async assesmentTerpilih(id, assesment) {
      this.tampil_assesment.id = id
      this.tampil_assesment.assesment = assesment

      let temp = {
        'id' : id,
        'assesment' : assesment
      }
      console.log('temp',temp)

      let asses = [...this.assesment_terpilih];

      asses.push(temp);
      this.$store.dispatch('tambahDataAssesment',asses);
      localStorage.setItem('assesment_terpilih', JSON.stringify(asses));
      this.assesment_terpilih = [...asses];

      console.log('asess',asses)


      console.log('id assesment', this.tampil_assesment.id)
      console.log('assesment terpilih', this.assesment_terpilih)
      console.log('diagnosis assesment', this.tampil_assesment.assesment)
      //console.log('parsedata assesment', parseData)
      //console.log('assesment terpilih', this.assesment_terpilih)
    },
    async getIdAssesment(id) {
      this.assesment_terpilih.id = id
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
        return res.id != this.assesment_terpilih.id
      });
      this.$store.dispatch('tambahDataAssesment', this.assesment_terpilih)
      localStorage.setItem('assesment_terpilih', JSON.stringify(this.assesment_terpilih))
    }
    /*async onSubmit() {
      const asses = {
        assesment : this.tambah_assesment.assesment
      }

      this.tambahDataAssesment(asses);
      console.log('assesment',asses)
      this.$router.push('/');*/

      /*let p = await this.tambahAssesment().then(res => res.tambah_assesment);
      
      if(p) {
        this.rekmed_assesment.assesment = p.assesment

        let parseData = JSON.parse(localStorage.getItem('rekmed_assesment')) || [];

        let assesments = parseData;

        console.log('parsedata',parseData)

        if (assesments == []) {
          assesments = [...this.$store.state.rekam_medis.assesment];
          console.log('assesment p ',assesment)
        }

        assesment.push(this.rekmed_assesment)

        this.$store.dispatch('tambahListAssesment', assesment)
        localStorage.setItem('rekmed_assesment', JSON.stringify(assesment))
       }*/
    //}
   /* async hapusAssesment() {
      let list_asses = [...this.rekmed_assesment];
      this.rekmed_assesment = list_asses.filter(res => {
        return res.id != this.id
      });

    }*/
  }
}

</script>

<style>
.assesment_terpilih {
  overflow-y: scroll;
}

/* .assesment_terpilih::-webkit-scrollbar {
  display: none;
} */

.kanan {
height: 400px;
}

.kiri {
height: 299px;
}

</style>
