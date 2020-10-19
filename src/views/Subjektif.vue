<!-- eslint-disable -->
<template>
  <div class="subjektif">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->
      <!-- <h3>ID Pasien : {{ pasien_rekmed.ID }}  </h3>
      <h3>Nama Pasien : {{ pasien_rekmed.nama}}</h3> -->
      <div class="row">
        <div class="col-md-4">
          <p class="h2 font-weight-bold my-3">Form Subjektif</p>
        </div>
        <!-- <div class="col-md-4"><p class="h2 text-right my-3">Form Subjektif</p></div>
        <div class="col-md-4"><p class="h2 text-right my-3">Form Subjektif</p></div> -->
      </div>
          <div class="row mb-4">
            <div class="col col-md-4">
              <router-link to="/riwayat_medis">
                <div class="card border-left-primary shadow-none">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="text-md font-weight-bold text-primary text-uppercase"> NAMA : {{ pasien_rekmed.nama}}</div>
                    </div>
                  </div>
                </div>
              </router-link>
            </div>
            <div class="col col-md-3">
              <router-link to="/riwayat_medis">
                <div class="card border-left-primary shadow-none">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="text-md font-weight-bold text-primary text-uppercase">ID PASIEN : {{ pasien_rekmed.ID }}</div>
                    </div>
                  </div>
                </div>
              </router-link>
            </div>
          </div>

        <div class="card" id="subjektif-page">
          <div class="card-header bg-dark">
            <i style="float: left;" class="fa fa-id-card"></i>
          </div>
          <div class="row my-4 mx-2">
            <div class="col col-md-6">
              <div class="row my-2">
                <div class="col col-md-10">
                  <input type="text" v-model="subjektif" class="form-control" style="width: 25rem;" id="cari_data_pasien" placeholder="Keluhan pasien">
                </div>
                <div class="col col-md-2">
                  <button type="button" class="btn btn-success" @click="tambahSubjektive()"><i class="fa fa-plus-circle"></i></button>
                </div>
              </div>
              <div class="row my-3">
                <div class="col col-md-12">
                  <div class="card" style="width: 97%">
                    <div class="card-body">
                      <ul class="list-group list-group-flush" v-for="(row, index) in rekmed_subjektif" v-bind:key="index">
                        <li class="list-group-item">{{ row.subjective }}<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif" @click="getIdSubjektif(row.id_subjective)"><i style="float: left;" class="fa fa-times"></i></button></span>
                        </li>
                      </ul>
                    </div>
                  </div>              
                </div>
              </div>
            </div>
            <div class="col col-md-6">
                <div class="row text-right">
                  <div class="col-2 my-2">
                    <span class="badge badge-pill badge-success py-1">Demam <span class="pr-1">+</span> </span>
                  </div>
                  <div class="col-2 my-2">
                    <span class="badge badge-pill badge-success py-1">Pusing <span class="pr-1">+</span> </span>
                  </div>
                  <div class="col-2 my-2">
                    <span class="badge badge-pill badge-success py-1">Mual <span class="pr-1">+</span></span>
                  </div>
                  <div class="col-4 my-2">
                    <span class="badge badge-pill badge-success py-1">Batuk tak berdahak <span class="pr-1">+</span></span>
                  </div>
                  <div class="col-4 my-2">
                    <span class="badge badge-pill badge-success py-1">Galau sepanjang hari <span class="pr-1">+</span></span>
                  </div>
                  <div class="col-5 my-2">
                    <span class="badge badge-pill badge-success py-1">Meringis menatap nasib <span class="pr-1">+</span></span>
                  </div>
                  <div class="col-4 my-2">
                    <span class="badge badge-pill badge-success py-1">Pasrah atas takdir <span class="pr-1">+</span></span>
                  </div>
                  <div class="col-2 my-2">
                    <span class="badge badge-pill badge-success">Jalani aja <span class="pr-1">+</span></span>
                  </div>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-9"></div>
          <div class="col-3">
            <button type="button" data-toggle="modal" data-target="#proses_subjektif"
              @click="getIdPasien(pasien_rekmed.ID)" class="btn btn-info my-3">Simpan dan lanjutkan <i
                class="fa fa-arrow-right"></i></button>
          </div>
        </div>

      <!-- Modal Hapus -->
      <div class="modal fade" id="hapus_subjektif" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Hapus Keluhan</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-dark">
              Yakin nih mau hapus aku?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-danger" @click="hapusSubjective()"
                data-dismiss="modal">Hapus</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal proses selanjutnya -->
      <div class="modal fade" id="proses_subjektif" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">lanjut ke proses objektif</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-dark">
              Yakin nih mau proses selanjutnya ke objective ?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-info" @click="prosesObjektif()"
                data-dismiss="modal">Oke</button>
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
  import {
    mapActions,
    mapGetters
  } from 'vuex'
  import axios from 'axios'

  export default {
    name: 'subjektif',
    components: {
      SidebarNav
    },
    data() {
      return {
        id: '',
        pasien_rekmed: [],
        subjektif: '',
        tambah_subjektif: '',
        rekmed_subjektif: [],
        pasien: []
      }
    },
    async created() {
      //localStorage.clear('subjective');
      const getData = (lokasi) => {
        let y = localStorage.getItem(lokasi);
        return JSON.parse(y) || [];
      }

      //this.rekmed_subjektif = getData('subjective');
      this.pasien_rekmed = getData('pasien');

      console.log('pasien_rekmed', this.pasien_rekmed)
      // console.log('rekmed_subjektif',this.rekmed_subjektif)
    },
    methods: {
      /* ...mapActions(['tambahDataSubjective']),*/
      tambahSubjektive() {
        if (this.subjektif != '') {
          /*let panjang = (this.rekmed_subjektif.length) ? this.rekmed_subjektif.length : 0;
          let temp = (panjang) ? this.rekmed_subjektif[panjang - 1].id : 0;

          temp += 1*/

          let temp_rekmed_subjektif = {
            'id_subjective': Math.random(),
            //'id_pasien': this.pasien_rekmed.ID,
            'subjective': this.subjektif,
          };

          let subjektif = [...this.rekmed_subjektif];

          // console.log(temp_rekmed_subjektif)

          subjektif.push(temp_rekmed_subjektif);
          this.subjektif = ''

          this.$store.dispatch('tambahDataSubjective', subjektif);
          localStorage.setItem('subjective', JSON.stringify(subjektif));

          this.rekmed_subjektif = [...subjektif];

          console.log('subjektif', this.rekmed_subjektif)
        } else {
          console.log('dicegah')
        }
        /*this.subjektif = '';
        this.id = '';*/
      },
      async hapusSubjective() {
        let list_subjek = [...this.rekmed_subjektif];
        this.rekmed_subjektif = list_subjek.filter(res => {
          return res.id_subjective != this.rekmed_subjektif.id_subjective
        });
        console.log('hapusSubjective', this.rekmed_subjektif)
        this.$store.dispatch('tambahDataSubjective', this.rekmed_subjektif)
        localStorage.setItem('subjective', JSON.stringify(this.rekmed_subjektif))
      },
      getIdSubjektif(id) {
        this.rekmed_subjektif.id_subjective = id
        console.log(id)
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
        if (pasien) {
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

  .card {
    border: 1px solid #eeeeee;
  }

  .card-body {
    padding: 6px 12px;
  }

</style>
