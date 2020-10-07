<!-- eslint-disable -->
<template>
  <div class="subjektif">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->
      <h3>ID Pasien : {{ pasien_rekmed.ID }}  </h3>
      <h3>Nama Pasien : {{ pasien_rekmed.nama}}</h3>
      <br>
      <h2 class="my-3 font-weight-bold">Form Subjektif</h2>

      <form>
        <div class="form-inline mb-4">
          <div class="row">
            <div class="col-10">
              <input type="text" v-model="subjektif" class="form-control mr-2" style="width: 54rem;" id="cari_data_pasien" placeholder="Keluhan pasien">       
            </div>
            <div class="col-2">
              <button type="button" class="btn btn-block btn-success mr-2" @click="tambahSubjektive()">Tambah <i
                class="fa fa-plus-circle"></i></button>
            </div>
          </div>
        </div>

        <div class="card" id="subjektif-page">
          <div class="card-header bg-dark">
            <i style="float: left;" class="fa fa-id-card"></i>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-6">
                <div class="card">
                  <div class="card-body">
                    <ul class="list-group list-group-flush" v-for="(row, index) in rekmed_subjektif" :key="row.id">
                      <li class="list-group-item">{{ row.subjective }}<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif" @click="getIdSubjektif(row.id)"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                    </ul>
                  </div>
                </div>
              </div> 
              <div class="col-6">
                <div class="row text-right">
                  <div class="col-2 my-1">
                    <span class="badge badge-pill badge-primary py-1"><span class="pr-1">+</span> Demam</span>
                  </div>
                  <div class="col-2 my-1">
                    <span class="badge badge-pill badge-primary py-1"><span class="pr-1">+</span> Pusing</span>
                  </div>
                  <div class="col-2 my-1">
                    <span class="badge badge-pill badge-primary py-1"><span class="pr-1">+</span> Mual</span>
                  </div>
                  <div class="col-4 my-1">
                    <span class="badge badge-pill badge-primary py-1"><span class="pr-1">+</span> Batuk tak berdahak</span>
                  </div>
                  <div class="col-4 my-1">
                    <span class="badge badge-pill badge-primary py-1"><span class="pr-1">+</span> Galau sepanjang hari</span>
                  </div>
                  <div class="col-5 my-1">
                    <span class="badge badge-pill badge-primary py-1"><span class="pr-1">+</span> Meringis menatap nasib</span>
                  </div>
                  <div class="col-4 my-1">
                    <span class="badge badge-pill badge-primary py-1"><span class="pr-1">+</span> Pasrah atas takdir</span>
                  </div>
                  <div class="col-2 my-1">
                    <span class="badge badge-pill badge-primary"><span class="pr-1">+</span> Jalani aja</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <button type="button" data-toggle="modal" data-target="#proses_subjektif" @click="getIdPasien(pasien_rekmed.ID)" class="btn btn-block btn-success mr-2" >Simpan dan lanjutkan <i
                class="fa fa-arrow-right"></i></button>
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
              <button type="button" class="btn btn-outline-dark" @click="hapusSubjective()" data-dismiss="modal">Hapus</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal proses selanjutnya -->
      <div class="modal fade" id="proses_subjektif" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">lanjut ke proses objektif</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-success">
              Yakin nih mau proses selanjutnya ke objective ?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-success" @click="prosesObjektif()" data-dismiss="modal">Oke</button>
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
import { mapActions, mapGetters } from 'vuex'
import axios from 'axios'

export default {
  name: 'subjektif',
  components: {
    SidebarNav
  },
  data() {
    return {
      id: Math.random(),
      pasien_rekmed: [],
      subjektif: '',
      tambah_subjektif: '',
      rekmed_subjektif: [],
      pasien: []
    }
  },
  async created() {
    /*localStorage.clear();*/
    const pasienRekmed = (pasien) => {
      let y = localStorage.getItem('pasien');
      return JSON.parse(y) || [];
    }
    const subjektif = (subjektif) => {
      let data = localStorage.getItem('rekmed_subjektif');
      return JSON.parse(data) || [];
    }

    this.rekmed_subjektif = subjektif('rekmed_subjektif');
    this.pasien_rekmed = pasienRekmed('pasien_rekmed');

    console.log('pasien_rekmed',this.pasien_rekmed)
    console.log('rekmed_subjektif',this.rekmed_subjektif)
  },
  methods : {
   /* ...mapActions(['tambahDataSubjective']),*/
    async tambahSubjektive() {
      let temp_rekmed_subjektif = {
        'subjective' : this.subjektif,
        'id' : this.id
      };
      let subjektif = [...this.rekmed_subjektif];

      subjektif.push(temp_rekmed_subjektif);

      this.$store.dispatch('tambahDataSubjective', subjektif);
      localStorage.setItem('rekmed_subjektif', JSON.stringify(subjektif));

      this.rekmed_subjektif = [...subjektif];
      /*this.subjektif = '';
      this.id = '';*/
    },
    async hapusSubjective() {
      let list_subjek = [...this.rekmed_subjektif];
      this.rekmed_subjektif = list_subjek.filter(res => {
        return res.id != this.id
      });
      console.log('hapusSubjective', this.rekmed_subjektif)
      this.$store.dispatch('tambahDataSubjective', this.rekmed_subjektif)
      localStorage.setItem('rekmed_subjektif', JSON.stringify(this.rekmed_subjektif))
    },
    getIdSubjektif(id) {
      this.id = id
    },
    getIdPasien(id) {
      this.pasien_rekmed.ID = id
    },
    async loadPasien(id = null) {
      if (id) {
        return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get/' + id).then(res => res.data)
      } else {
        return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get').then(res => res.data)
      }
    },
    async prosesObjektif() {
      let pasien = await this.loadPasien(this.pasien_rekmed.ID)
      if(pasien) {
        this.$store.dispatch('simpanDataPasien', pasien)
        localStorage.setItem('pasien', JSON.stringify(pasien));
        this.$router.push('/objective')
      }
    }
  }
}

</script>

<style>
#subjektif-page {
  overflow-y: scroll;
  height: 400px;
}
</style>
