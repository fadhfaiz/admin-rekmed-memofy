<!-- eslint-disable -->
<template>
  <div class="plan">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->
      <!-- <h3>ID Pasien : {{ pasien_rekmed.ID }}  </h3>
      <h3>Nama Pasien : {{ pasien_rekmed.nama}}</h3> -->
      <h2 class="my-3 font-weight-bold">Form Plan</h2>
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

      <small class="text-danger mb-3">* Klik panel lain untuk membuka form tersebut.</small>

      <div>
        <div id="accordion">
          <div class="card plan-card-kotak">
            <div class="card-header plan-card-kotak btn btn-link plan-hover-atas" id="headingSatu"
              data-toggle="collapse" data-target="#collapseSatu" aria-expanded="false" aria-controls="collapseSatu">
              <h5 class="mb-0 text-left">
                Rencana Diagnostik (D)
              </h5>
            </div>
            <div id="collapseSatu" class="collapse show" aria-labelledby="headingSatu" data-parent="#accordion">
              <div class="card-body plan-card-kotak">
                <div class="row">
                  <div class="col-md-6">
                    <div class="card">
                      <div class="card-header font-weight-bold bg-dark text-white">
                        Rencana Diagnostik
                      </div>
                      <div class="card-body">
                        <div class="form-inline mb-4">
                          <div class="row">
                            <div class="col-8">
                              <input type="text" th scope="col" style="width: 19rem;" class="form-control mx-6"
                                placeholder="Cari / tambah diagnosis" v-model="nama_diagnosis">
                            </div>
                            <div class="col-4">
                              <button type="button" @click="onSubmitDiagnosis()"
                                class="btn btn-block btn-success">Tambah <i class="fa fa-plus-circle"></i></button>
                            </div>
                          </div>
                        </div>
                        <div class="plan_form kiri" v-if="nama_diagnosis ==''">
                          <div class="row">
                            <div class="col-12 my-3">
                              <div class="card my-3" style="width: 25rem;">
                                <ul class="list-group list-group-flush" v-for="(row, index) in diagnosis_terpilih"
                                  v-bind:key="index">
                                  <li class="list-group-item"><span>{{ row.nama_diagnosis }}<button
                                        class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                        data-target="#hapus_plan_diagnosis" @click="getIdPlanDiagnosis(row.ID)"><i
                                          style="float: left;" class="fa fa-times"></i></button></span></li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- pencarian -->
                        <div class="plan_form cari" style="width: 20rem" v-else>
                          <table class="table table-hover table-bordered" style="width: 18rem;">
                            <thead class="text-center">
                              <th>ID</th>
                              <th>Nama Diagnosis</th>
                              <th>Aksi</th>
                            </thead>
                            <tbody>
                              <tr class="text-center" v-for="(row, index) in diagnosis_cocok" v-bind:key="index">
                                <td>{{row.ID}}</td>
                                <td>{{row.nama_diagnosis}}</td>
                                <td>
                                  <button class="btn btn-success btn-sm float-right" type="button"
                                    @click="onSubmitDiagnosisCari(row.ID, row.nama_diagnosis)"><i style="float: left;"
                                      class="fa fa-plus-circle"></i></button>
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
                        Rencana Diagnostik Terpilih
                      </div>
                      <div class="card-body plan_form kanan">
                        <div class="card" style="width: 26rem;">
                         <!--  <ul class="list-group list-group-flush">
                            <li class="list-group-item">n<span><button class="btn btn-danger btn-sm float-right"
                                  type="button" data-toggle="modal" data-target="#hapus_plan_diagnosis"><i
                                    style="float: left;" class="fa fa-times"></i></button></span></li>
                          </ul> -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card plan-card-kotak">
            <div class="card-header plan-card-kotak btn btn-link plan-hover-atas" id="headingDua" data-toggle="collapse"
              data-target="#collapseDua" aria-expanded="false" aria-controls="collapseDua">
              <h5 class="mb-0 text-left">
                Rencana Terapi / Tindakan (Tx)
              </h5>
            </div>
            <div id="collapseDua" class="collapse" aria-labelledby="headingDua" data-parent="#accordion">
              <div class="card-body plan-card-kotak">
                <div class="row">
                  <div class="col-md-7">
                    <div class="card">
                      <div class="card-header font-weight-bold bg-dark text-white">
                        Terapi / Tindakan
                      </div>
                      <div class="card-body">
                        <div class="form-inline mb-4">
                          <div class="row">
                            <div class="col-5">
                              <input type="text" th scope="col" style="width: 15rem;" class="form-control"
                                v-model="nama_terapi" placeholder="Cari / tambah terapi">
                            </div>
                            <div class="col-3">
                              <input type="text" th scope="col" style="width: 8rem;margin-left: 20px"
                                class="form-control" v-model="biaya_terapi" placeholder="Biaya">
                            </div>
                            <div class="col-3">
                              <button type="button" @click="onSubmitTerapi()" class="btn btn-block btn-success"
                                style="margin-left: 20px">Tambah<i class="fa fa-plus-circle"></i></button>
                            </div>
                          </div>
                        </div>
                        <div class="plan_form kiri" v-if="nama_terapi == ''">
                          <table class="table table-hover table-borderless table-sm">
                            <thead>
                              <tr class="text-center bg-dark" style="color: white;">
                                <th scope="col">ID</th>
                                <th scope="col" style="width: 10rem;">Nama Terapi</th>
                                <th scope="col">Biaya Terapi</th>
                                <th scope="col">Aksi</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="(row, index) in terapi_terpilih" v-bind:key="index">
                                <th scope="row" class="text-center">TR0{{ index+1 }}</th>
                                <td class="text-center">{{ row.nama_terapi }}</td>
                                <td class="text-center">{{ row.biaya_terapi }}</td>
                                <td class="text-center">
                                  <button class="btn btn-danger btn-sm mr-2" type="button" data-toggle="modal"
                                    data-target="#hapus_plan_terapi" @click="getIdPlanTerapi(row.ID)"><i
                                      style="float: left;" class="fa fa-times"></i></button>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <!-- pencarian -->
                        <div class="plan_form cari" style="width: 25rem" v-else>
                          <table class="table table-hover table-bordered" style="width: 23rem;">
                            <thead class="text-center">
                              <th>ID</th>
                              <th>Nama Terapi</th>
                              <th>Biaya Terapi</th>
                              <th>Aksi</th>
                            </thead>
                            <tbody>
                              <tr class="text-center" v-for="(row, index) in terapi_cocok" v-bind:key="index">
                                <td>{{row.ID}}</td>
                                <td>{{row.nama_terapi}}</td>
                                <td>{{row.biaya_terapi}}</td>
                                <td>
                                  <button class="btn btn-success btn-sm float-right" type="button"
                                    @click="onSubmitTerapiCari(row.ID, row.nama_terapi, row.biaya_terapi)"><i
                                      style="float: left;" class="fa fa-plus-circle"></i></button>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-5">
                    <div class="card">
                      <div class="card-header font-weight-bold bg-dark text-white">
                        Terapi Terpilih
                      </div>
                      <div class="card-body plan_form kanan">
                        <div class="card" style="width: 21rem;">
                          <!-- <ul class="list-group list-group-flush">
                            <li class="list-group-item">Demam<span><button class="btn btn-danger btn-sm float-right"
                                  type="button" data-toggle="modal" data-target="#hapus_subjektif"><i
                                    style="float: left;" class="fa fa-times"></i></button></span></li>
                            <li class="list-group-item">Stress<span><button class="btn btn-danger btn-sm float-right"
                                  type="button" data-toggle="modal" data-target="#hapus_subjektif"><i
                                    style="float: left;" class="fa fa-times"></i></button></span></li>
                            <li class="list-group-item">Batuk tak berdahak<span><button
                                  class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                  data-target="#hapus_subjektif"><i style="float: left;"
                                    class="fa fa-times"></i></button></span></li>
                            <li class="list-group-item">Galau sepanjang hari<span><button
                                  class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                  data-target="#hapus_subjektif"><i style="float: left;"
                                    class="fa fa-times"></i></button></span>
                            </li>
                            <li class="list-group-item">Galau sepanjang hari Senin<span><button
                                  class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                  data-target="#hapus_subjektif"><i style="float: left;"
                                    class="fa fa-times"></i></button></span>
                            </li>
                          </ul> -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card plan-card-kotak">
            <div class="card-header plan-card-kotak btn btn-link plan-hover-atas" id="headingTiga"
              data-toggle="collapse" data-target="#collapseTiga" aria-expanded="true" aria-controls="collapseTiga">
              <h5 class="mb-0 text-left">
                Rencana Edukasi (E)
              </h5>
            </div>
            <div id="collapseTiga" class="collapse" aria-labelledby="headingTiga" data-parent="#accordion">
              <div class="card-body plan-card-kotak">
                <div class="row">
                  <div class="col-md-6">
                    <div class="card">
                      <div class="card-header font-weight-bold bg-dark text-white">
                        Daftar Edukasi
                      </div>
                      <div class="card-body">
                        <div class="form-inline mb-4">
                          <div class="row">
                            <div class="col-7">
                              <input type="text" th scope="col" style="width: 17rem;" class="form-control"
                                placeholder="Cari / tambah diagnosis" v-model="nama_edukasi">
                            </div>
                            <div class="col-5">
                              <button type="button" @click="onSubmitEdukasi()"
                                class="btn btn-block btn-success mx-2">Tambah <i class="fa fa-plus-circle"></i></button>
                            </div>
                          </div>
                        </div>
                        <div class="plan_form kiri" v-if="nama_edukasi ==''">
                          <div class="row">
                            <div class="col-12 my-3">
                              <div class="card my-3" style="width: 25rem;">
                                <ul class="list-group list-group-flush" v-for="(row, index) in edukasi_terpilih"
                                  v-bind:key="index">
                                  <li class="list-group-item"><span>{{ row.nama_edukasi }}<button
                                        class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                        data-target="#hapus_plan_edukasi" @click="getIdPlanEdukasi(row.ID)"><i
                                          style="float: left;" class="fa fa-times"></i></button></span></li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- pencarian -->
                        <div class="plan_form cari" style="width: 20rem" v-else>
                          <table class="table table-hover table-bordered" style="width: 18rem;">
                            <thead class="text-center">
                              <th>ID</th>
                              <th>Nama Edukasi</th>
                              <th>Aksi</th>
                            </thead>
                            <tbody>
                              <tr class="text-center" v-for="(row, index) in edukasi_cocok" v-bind:key="index">
                                <td>{{row.ID}}</td>
                                <td>{{row.nama_edukasi}}</td>
                                <td>
                                  <button class="btn btn-success btn-sm float-right" type="button"
                                    @click="onSubmitEdukasiCari(row.ID, row.nama_edukasi)"><i style="float: left;"
                                      class="fa fa-plus-circle"></i></button>
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
                        Edukasi Terpilih
                      </div>
                      <div class="card-body plan_form kanan">
                        <div class="card" style="width: 26rem;">
                          <!-- <ul class="list-group list-group-flush">
                            <li class="list-group-item">Demam<span><button class="btn btn-danger btn-sm float-right"
                                  type="button" data-toggle="modal" data-target="#hapus_subjektif"><i
                                    style="float: left;" class="fa fa-times"></i></button></span></li>
                            <li class="list-group-item">Stress<span><button class="btn btn-danger btn-sm float-right"
                                  type="button" data-toggle="modal" data-target="#hapus_subjektif"><i
                                    style="float: left;" class="fa fa-times"></i></button></span></li>
                            <li class="list-group-item">Batuk tak berdahak<span><button
                                  class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                  data-target="#hapus_subjektif"><i style="float: left;"
                                    class="fa fa-times"></i></button></span></li>
                            <li class="list-group-item">Galau sepanjang hari<span><button
                                  class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                  data-target="#hapus_subjektif"><i style="float: left;"
                                    class="fa fa-times"></i></button></span>
                            </li>
                          </ul> -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-9"></div>
            <div class="col-3 my-3">
              <button type="button" data-toggle="modal" data-target="#proses_resep"
                @click="getIdPasien(pasien_rekmed.ID)" class="btn btn-info mt-3">Simpan dan lanjutkan <i
                  class="fa fa-arrow-right"></i></button>
            </div>
          </div>
        </div>
      </div>
      <!-- Modal proses selanjutnya -->
      <div class="modal fade" id="proses_resep" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">lanjut ke proses resep obat</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              Yakin nih mau proses selanjutnya ke Resep Dokter ?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-info" @click="prosesResep()" data-dismiss="modal">Oke</button>
            </div>
          </div>
        </div>
      </div>
      <!-- Modal Hapus Plan Diagnosis-->
      <div class="modal fade" id="hapus_plan_diagnosis" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Hapus Plan Diagnosis</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              Yakin nih mau hapus aku?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-danger" @click="hapusPlanDiagnosis()"
                data-dismiss="modal">Hapus</button>
            </div>
          </div>
        </div>
      </div>
      <!-- Modal Hapus Plan Terapi-->
      <div class="modal fade" id="hapus_plan_terapi" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Hapus Plan Terapi</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              Yakin nih mau hapus aku?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-danger" @click="hapusPlanTerapi()"
                data-dismiss="modal">Hapus</button>
            </div>
          </div>
        </div>
      </div>
      <!-- Modal Hapus Plan Edukasi-->
      <div class="modal fade" id="hapus_plan_edukasi" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Hapus Plan Edukasi</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              Yakin nih mau hapus aku?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-danger" @click="hapusPlanEdukasi()"
                data-dismiss="modal">Hapus</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- </div> -->
  </div>
</template>

<script>
/*eslint-disable*/
  // @ is an alias to /src
  import SidebarNav from '@/components/SidebarNav.vue'
  import axios from 'axios'
  export default {
    name: 'plan',
    components: {
      SidebarNav
    },
    data() {
      return {
        pasien_rekmed: [],
        nama_diagnosis: '',
        nama_edukasi: '',
        nama_terapi: '',
        biaya_terapi: '',
        tampil_plan_diagnosis: [],
        tampil_plan_terapi: [],
        tampil_plan_edukasi: [],
        diagnosis_terpilih: [],
        terapi_terpilih: [],
        edukasi_terpilih: [],
        diagnosis_cocok: [],
        terapi_cocok: [],
        edukasi_cocok: []

      }
    },
    async created() {
      const getData = (x) => {
        let y = localStorage.getItem(x);
        return JSON.parse(y) || [];
      }
      this.pasien_rekmed = getData('pasien');
      this.tampil_plan_diagnosis = await this.tampilPlanDiagnosis();
      this.tampil_plan_terapi = await this.tampilPlanTerapi();
      this.tampil_plan_edukasi = await this.tampilPlanEdukasi();
      //this.diagnosis_terpilih = getData('plan_diagnosis');
      //console.log('pasien_rekmed',this.pasien_rekmed)
      console.log('tampil_plan_diagnosis', this.tampil_plan_diagnosis)
    },
    watch: {
      nama_diagnosis(val) {
        this.diagnosis_cocok = this.tampil_plan_diagnosis.filter(res => {
          return res.nama_diagnosis.toLowerCase().search(val.toLowerCase()) != -1;
        });
        //      console.log('ketemu', this.diagnosis_cocok)
      },
      nama_terapi(val) {
        this.terapi_cocok = this.tampil_plan_terapi.filter(res => {
          return res.nama_terapi.toLowerCase().search(val.toLowerCase()) != -1;
        });
        //    console.log('ketemu', this.terapi_cocok)
      },
      nama_edukasi(val) {
        this.edukasi_cocok = this.tampil_plan_edukasi.filter(res => {
          return res.nama_edukasi.toLowerCase().search(val.toLowerCase()) != -1;
        });
        //  console.log('ketemu', this.edukasi_cocok)
      }
    },
    methods: {
      // tambah plan
      async tambahPlanDiagnosis() {
        return await axios.post('http://localhost/rekmed-server/api/v1/Plan_diagnosis/post', {
          nama_diagnosis: this.nama_diagnosis
        }).then(res => res.data.plan)
      },
      async tambahPlanTerapi() {
        return await axios.post('http://localhost/rekmed-server/api/v1/Plan_terapi/post', {
          nama_terapi: this.nama_terapi,
          biaya_terapi: this.biaya_terapi
        }).then(res => res.data.plan_terapi)
      },
      async tambahPlanEdukasi() {
        return await axios.post('http://localhost/rekmed-server/api/v1/Plan_edukasi/post', {
          nama_edukasi: this.nama_edukasi
        }).then(res => res.data.plan_edukasi)
      },
      async loadPasien(id = null) {
        if (id) {
          return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get/' + id).then(res => res.data)
        } else {
          return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get').then(res => res.data)
        }
      },
      //on submit
      async onSubmitDiagnosis() {
        this.tampil_plan_diagnosis = await this.tambahPlanDiagnosis()
        if (this.tampil_plan_diagnosis) {

          let temp_diagnosis = {
            'ID': Math.random(),
            'ID_pasien': this.pasien_rekmed.ID,
            'nama_diagnosis': this.nama_diagnosis
          }
          this.diagnosis_terpilih.push(temp_diagnosis);
          this.nama_diagnosis = ''
        }

        this.$store.dispatch('tambahDataPlanDiagnosis', this.diagnosis_terpilih)
        localStorage.setItem('plan_diagnosis', this.diagnosis_terpilih)

        console.log('diagnosis_terpilih', this.diagnosis_terpilih)

      },
      async onSubmitTerapi() {
        this.tampil_plan_terapi = await this.tambahPlanTerapi()
        if (this.tampil_plan_terapi) {

          let temp_terapi = {
            'ID': Math.random(),
            'ID_pasien': this.pasien_rekmed.ID,
            'nama_terapi': this.nama_terapi,
            'biaya_terapi': this.biaya_terapi
          }
          this.terapi_terpilih.push(temp_terapi);
          this.nama_terapi = ''
          this.biaya_terapi = ''
        }

        this.$store.dispatch('tambahDataPlanTerapi', this.terapi_terpilih)
        localStorage.setItem('plan_terapi', this.terapi_terpilih)

        console.log('terapi_terpilih', this.terapi_terpilih)

      },
      async onSubmitEdukasi() {
        this.tampil_plan_edukasi = await this.tambahPlanEdukasi()
        if (this.tampil_plan_edukasi) {

          let temp_edukasi = {
            'ID': Math.random(),
            'ID_pasien': this.pasien_rekmed.ID,
            'nama_edukasi': this.nama_edukasi,
          }
          this.edukasi_terpilih.push(temp_edukasi);
          this.nama_edukasi = ''
        }

        this.$store.dispatch('tambahDataPlanEdukasi', this.edukasi_terpilih)
        localStorage.setItem('plan_edukasi', this.edukasi_terpilih)

        console.log('edukasi_terpilih', this.edukasi_terpilih)

      },
      //on submit pencarian
      async onSubmitDiagnosisCari(id, nama = null) {
        this.diagnosis_terpilih.ID = id
        if (nama) this.nama_diagnosis = nama;
        let temp_diagnosis = {
          'ID': Math.random(),
          'ID_pasien': this.pasien_rekmed.ID,
          'nama_diagnosis': this.nama_diagnosis
        }
        this.diagnosis_terpilih.push(temp_diagnosis);
        this.nama_diagnosis = ''
        this.$store.dispatch('tambahDataPlanDiagnosis', this.diagnosis_terpilih)
        localStorage.setItem('plan_diagnosis', this.diagnosis_terpilih)

        console.log('diagnosis_terpilih cari', this.diagnosis_terpilih)

      },
      async onSubmitTerapiCari(id, nama = null, biaya = null) {
        this.terapi_terpilih.ID = id
        if (nama) this.nama_terapi = nama;
        if (biaya) this.biaya_terapi = biaya;

        let temp_terapi = {
          'ID': Math.random(),
          'ID_pasien': this.pasien_rekmed.ID,
          'nama_terapi': this.nama_terapi,
          'biaya_terapi': this.biaya_terapi
        }
        this.terapi_terpilih.push(temp_terapi);
        this.nama_terapi = ''
        this.biaya_terapi = ''

        this.$store.dispatch('tambahDataPlanTerapi', this.terapi_terpilih)
        localStorage.setItem('plan_terapi', this.terapi_terpilih)

        console.log('terapi_terpilih cari', this.terapi_terpilih)

      },
      async onSubmitEdukasiCari(id, nama = null) {
        this.edukasi_terpilih.ID = id
        if (nama) this.nama_edukasi = nama;

        let temp_edukasi = {
          'ID': Math.random(),
          'ID_pasien': this.pasien_rekmed.ID,
          'nama_edukasi': this.nama_edukasi,
        }
        this.edukasi_terpilih.push(temp_edukasi);
        this.nama_edukasi = ''
        this.$store.dispatch('tambahDataPlanEdukasi', this.edukasi_terpilih)
        localStorage.setItem('plan_edukasi', this.edukasi_terpilih)

      },
      //tampil data
      async tampilPlanDiagnosis(id = null) {
        if (id) {
          return await axios.get('http://localhost/rekmed-server/api/v1/Plan_diagnosis/get/' + id).then(res => this
            .tambah_plan_diagnosis = res.data)
        } else {
          return await axios.get('http://localhost/rekmed-server/api/v1/Plan_diagnosis/get').then(res => this
            .tampil_plan_diagnosis = res.data)
        }
      },
      async tampilPlanTerapi(id = null) {
        if (id) {
          return await axios.get('http://localhost/rekmed-server/api/v1/Plan_terapi/get/' + id).then(res => this
            .tambah_plan_terapi = res.data)
        } else {
          return await axios.get('http://localhost/rekmed-server/api/v1/Plan_terapi/get').then(res => this
            .tampil_plan_terapi = res.data)
        }
      },
      async tampilPlanEdukasi(id = null) {
        if (id) {
          return await axios.get('http://localhost/rekmed-server/api/v1/Plan_edukasi/get/' + id).then(res => this
            .tambah_plan_edukasi = res.data)
        } else {
          return await axios.get('http://localhost/rekmed-server/api/v1/Plan_edukasi/get').then(res => this
            .tampil_plan_edukasi = res.data)
        }
      },
      //get id
      getIdPlanDiagnosis(id) {
        this.diagnosis_terpilih.ID = id
      },
      getIdPlanTerapi(id) {
        this.terapi_terpilih.ID = id
      },
      getIdPlanEdukasi(id) {
        this.edukasi_terpilih.ID = id
      },
      getIdPasien(id) {
        this.pasien_rekmed.ID = id
      },
      //hapus data
      hapusPlanDiagnosis() {
        let list_diagnosis = [...this.diagnosis_terpilih];
        this.diagnosis_terpilih = list_diagnosis.filter(res => {
          return res.ID != this.diagnosis_terpilih.ID
        });
        console.log(list_diagnosis)
        this.$store.dispatch('tambahDataPlanDiagnosis', this.diagnosis_terpilih)
        localStorage.setItem('plan_diagnosis', JSON.stringify(this.diagnosis_terpilih))
      },
      hapusPlanEdukasi() {
        let list_edukasi = [...this.edukasi_terpilih];
        this.edukasi_terpilih = list_edukasi.filter(res => {
          return res.ID != this.edukasi_terpilih.ID
        });
        console.log(list_edukasi)
        this.$store.dispatch('tambahDataPlanEdukasi', this.edukasi_terpilih)
        localStorage.setItem('plan_edukasi', JSON.stringify(this.edukasi_terpilih))
      },
      hapusPlanTerapi() {
        let list_terapi = [...this.terapi_terpilih];
        this.terapi_terpilih = list_terapi.filter(res => {
          return res.ID != this.terapi_terpilih.ID
        });
        console.log(list_terapi)
        this.$store.dispatch('tambahDataPlanTerapi', this.terapi_terpilih)
        localStorage.setItem('plan_terapi', JSON.stringify(this.terapi_terpilih))
      },
      //prose selanjutnya
      async prosesResep() {
        let pasien = await this.loadPasien(this.pasien_rekmed.ID)
        if (pasien) {
          this.$store.dispatch('simpanDataPasien', pasien)
          localStorage.setItem('pasien', JSON.stringify(pasien));
          this.$router.push('/obat')
        }
      }
    }
  }

</script>

<style>
  .plan_form {
    overflow-y: scroll;
  }

  /* .assesment_terpilih::-webkit-scrollbar {
  display: none;
} */

  .kanan {
    height: 399px;
  }

  .kiri {
    height: 299px;
  }

  .plan-card-kotak {
    border-radius: 0px;
  }

  .cari {
    height: 150px;
  }

  a {
    text-decoration: none;
  }

  .plan-hover-atas {
    background-image: -webkit-linear-gradient(left, #056644, #05AC72, #0AD48B);
    /* background-color: #13EBA2; */
    border-radius: 0.35rem !important;
    color: #fff !important;
    border-right: 0px !important;
    border-left: 0px !important;
    padding-top: 0.75rem !important;
    padding-bottom: 0.75rem !important;
  }

  .plan-hover-atas:hover {
    background-color: #15c73c;
  }

  .card {
    /* border: 0px !important; */
    /* margin-bottom: 0.5rem !important; */
    /* border-radius: 0.35rem !important; */
    border: 1px solid #eeeeee !important;
  }

  .card-body {
    padding: 6px 12px;
  }

</style>
