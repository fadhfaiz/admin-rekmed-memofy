<!-- eslint-disable -->
<template>
  <div class="plan">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->
      <h3>ID Pasien : {{ pasien_rekmed.ID }}  </h3>
      <h3>Nama Pasien : {{ pasien_rekmed.nama}}</h3>
      <br>
      <h2 class="my-3 font-weight-bold">Form Plan</h2>

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
                              <input type="text" th scope="col" style="width: 19rem;" class="form-control mx-6" id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="tambah_plan_diagnosis.nama_diagnosis">
                            </div>
                            <div class="col-4">
                              <button type="button" @click="onSubmit()" class="btn btn-block btn-success">Tambah <i class="fa fa-plus-circle"></i></button>
                            </div>
                          </div>
                        </div>
                        <div class="plan_form kiri">
                          <table class="table table-hover table-borderless table-sm">
                            <thead>
                              <tr class="text-center bg-dark" style="color: white;">
                                <th scope="col">ID</th>
                                <th scope="col" style="width: 20rem;">Diagnosis</th>
                                <th scope="col">Proses</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="(row, index) in tampil_plan_diagnosis" :key="index">
                                <th scope="row" class="text-center">P0{{ index+1 }}</th>
                                <td class="text-center">{{ row.nama_diagnosis }}</td>
                                <td class="text-center">
                                  <button class="btn btn-info btn-sm mr-2" type="button" @click="planDiagnosisTerpilih(row.ID, row.nama_diagnosis)" data-toggle="modal" data-target="#proses_antrian"><i style="float: left;" class="fa fa-arrow-right"></i></button>
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
                        <ul v-for="(row, index) in plan_diagnosis_terpilih" :key="index" class="list-group list-group-flush">
                          <li class="list-group-item">{{ row.nama_diagnosis }}<span><button class="btn btn-danger btn-sm float-right"
                                type="button" data-toggle="modal" data-target="#hapus_plan_diagnosis" @click="getIdPlanDiagnosis(row.ID)"><i style="float: left;"
                                  class="fa fa-times"></i></button></span></li>
                        </ul>
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
                          <input type="text" th scope="col" style="width: 15rem;" class="form-control mr-1"
                            id="cari_data_pasien" placeholder="Cari / tambah terapi">
                          <input type="text" th scope="col" style="width: 10rem;" class="form-control mr-1"
                            id="cari_data_pasien" placeholder="Biaya">
                          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah <i class="fa fa-plus-circle"></i></button></router-link>
                        </div>
                        <div class="plan_form kiri">
                          <table v-if="keluhan_pasien != ''" class="table table-hover table-borderless table-sm">
                            <thead>
                              <tr class="text-center bg-dark" style="color: white;">
                                <th scope="col">ID</th>
                                <th scope="col" style="width: 15rem;">Nama Terapi</th>
                                <th scope="col">Biaya</th>
                                <th scope="col">Proses</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="(row, index) in pasien" :key="index">
                                <th scope="row" class="text-center">TR0{{ index+1 }}</th>
                                <td class="text-center">{{ row.Rekam_Medis }}</td>
                                <td class="text-center">{{ row.Harga_Rekmed }}</td>
                                <td class="text-center">
                                  <button class="btn btn-info btn-sm mr-2" type="button" data-toggle="modal"
                                    data-target="#proses_antrian"><i style="float: left;"
                                      class="fa fa-arrow-right"></i></button>
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
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">Demam<span><button class="btn btn-danger btn-sm float-right"
                                type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Stress<span><button class="btn btn-danger btn-sm float-right"
                                type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span></li>
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
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                </div>
              </div>
            </div>
          </div>
          <!-- <div class="card plan-card-kotak">
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
                        Daftar Diagnosis
                      </div>
                      <div class="card-body">
                        <div class="form-inline mb-4">
                          <input type="text" th scope="col" style="width: 17rem;" class="form-control mr-1"
                            id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="keluhan_pasien">
                          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah <i class="fa fa-plus-circle"></i></button></router-link>
                        </div>
                        <div class="plan_form kiri">
                          <table v-if="keluhan_pasien != ''" class="table table-hover table-bordered">
                            <thead>
                              <tr class="text-center bg-dark" style="color: white;">
                                <th scope="col">ID</th>
                                <th scope="col" style="width: 20rem;">Diagnosis</th>
                                <th scope="col">Proses</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="(row, index) in pasien" :key="index">
                                <th scope="row" class="text-center">P0{{ index+1 }}</th>
                                <td class="text-center">{{ row.Rekam_Medis }}</td>
                                <td class="text-center">
                                  <button class="btn btn-info btn-sm mr-2" type="button" data-toggle="modal"
                                    data-target="#proses_antrian"><i style="float: left;"
                                      class="fa fa-arrow-right"></i></button>
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
                      Assesment Terpilih
                    </div>
                    <div class="card-body plan_form kanan">
                      <div class="card" style="width: 26rem;">
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">Demam<span><button class="btn btn-danger btn-sm float-right"
                                type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Stress<span><button class="btn btn-danger btn-sm float-right"
                                type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Batuk tak berdahak<span><button
                                class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Galau sepanjang hari<span><button
                                class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                </div>
              </div>
            </div>
          </div> -->
          <!-- <div class="card plan-card-kotak">
            <div class="card-header plan-card-kotak btn btn-link plan-hover-atas" id="headingEmpat"
              data-toggle="collapse" data-target="#collapseEmpat" aria-expanded="true" aria-controls="collapseEmpat">
              <h5 class="mb-0 text-left">
                Resep Dokter
              </h5>
            </div>
            <div id="collapseEmpat" class="collapse" aria-labelledby="headingEmpat" data-parent="#accordion">
              <div class="card-body plan-card-kotak">
                <div class="row">
                  <div class="col-md-12 mb-3">
                    <div class="card">
                      <div class="card-header font-weight-bold bg-dark text-white">
                        Daftar Resep Dokter
                      </div>
                      <div class="card-body">
                        <div class="form-inline mb-4">
                          <input type="text" th scope="col" style="width: 17rem;" class="form-control mr-1"
                            id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="keluhan_pasien">
                          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah <i class="fa fa-plus-circle"></i></button></router-link>
                        </div>
                        <div class="plan_form kiri">
                          <table v-if="keluhan_pasien != ''" class="table table-hover table-bordered">
                            <thead>
                              <tr class="text-center bg-dark" style="color: white;">
                                <th scope="col">ID</th>
                                <th scope="col" style="width: 20rem;">Diagnosis</th>
                                <th scope="col">Proses</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-for="(row, index) in pasien" :key="index">
                                <th scope="row" class="text-center">P0{{ index+1 }}</th>
                                <td class="text-center">{{ row.Rekam_Medis }}</td>
                                <td class="text-center">
                                  <button class="btn btn-info btn-sm mr-2" type="button" data-toggle="modal"
                                    data-target="#proses_antrian"><i style="float: left;"
                                      class="fa fa-arrow-right"></i></button>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12">
                  <div class="card">
                    <div class="card-header font-weight-bold bg-dark text-white">
                      Rekap Resep
                    </div>
                    <div class="card-body plan_form kanan">
                      <div class="card" style="width: 26rem;">
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">Demam<span><button class="btn btn-danger btn-sm float-right"
                                type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Stress<span><button class="btn btn-danger btn-sm float-right"
                                type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Batuk tak berdahak<span><button
                                class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Galau sepanjang hari<span><button
                                class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                                data-target="#hapus_subjektif"><i style="float: left;"
                                  class="fa fa-times"></i></button></span>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                </div>
              </div>
            </div>
          </div> -->
        </div>
      </div>
      <!-- Modal Hapus -->
      <div class="modal fade" id="hapus_plan_diagnosis" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
              <button type="button" class="btn btn-outline-dark" @click="hapusPlanDiagnosis()" data-dismiss="modal">Hapus</button>
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
  data () {
    return {
      tambah_plan_diagnosis : {
        nama_diagnosis : ''
      },
      pasien_rekmed : [],
      tampil_plan_diagnosis : [],
      plan_diagnosis_terpilih : []

    }
  },
  async created() {
    const pasienRekmed = (pasien) => {
      let y = localStorage.getItem('pasien');
      return JSON.parse(y) || [];
    }
    this.pasien_rekmed = pasienRekmed('pasien_rekmed');
    console.log('pasien_rekmed',this.pasien_rekmed)
  },
  mounted() {
    this.tampilPlanDiagnosis()
  },
  methods : {
    async tambahPlanDiagnosis() {
      return await axios.post('http://localhost/rekmed-server/api/v1/Plan_diagnosis/post', this.tambah_plan_diagnosis).then(res => res.data.plan)     
    },
    async onSubmit() {
      this.tampil_plan_diagnosis = await this.tambahPlanDiagnosis()
      if(this.tampil_plan_diagnosis) {
        this.tambah_plan_diagnosis.nama_diagnosis = ''
      }
    },
    async tampilPlanDiagnosis(id = null) {
      if (id) {
        return await axios.get('http://localhost/rekmed-server/api/v1/Plan_diagnosis/get/' + id).then(res => this.tambah_plan_diagnosis = res.data)
      } else {
        return await axios.get('http://localhost/rekmed-server/api/v1/Plan_diagnosis/get').then(res => this.tampil_plan_diagnosis = res.data)
        console.log('tampil_plan_diagnosis', this.tampil_plan_diagnosis)
      }
    },
    async planDiagnosisTerpilih(id, namaDiagnosis) {
      this.tampil_plan_diagnosis.ID = id
      this.tampil_plan_diagnosis.nama_diagnosis = namaDiagnosis

      let temp_diagnosis = {
        'ID' : id,
        'nama_diagnosis' : namaDiagnosis
      }
      console.log('temp_diagnosis', temp_diagnosis)

      //let diagnosis = [...this.plan_diagnosis_terpilih]

      this.plan_diagnosis_terpilih.push(temp_diagnosis);

      this.$store.dispatch('tambahDataPlanDiagnosis', this.plan_diagnosis_terpilih);
      localStorage.setItem('plan_diagnosis_terpilih', JSON.stringify(this.plan_diagnosis_terpilih));

      //this.plan_diagnosis_terpilih = [...diagnosis]

      //console.log('diagnosis', diagnosis)
      console.log('id diagnosis', this.tampil_plan_diagnosis.ID)
      console.log('nama diagnosis', this.tampil_plan_diagnosis.nama_diagnosis)
      console.log('plan terpilih', this.plan_diagnosis_terpilih)

    },
    getIdPlanDiagnosis(id) {
      this.plan_diagnosis_terpilih.ID = id
      //console.log('id', id)
    },
    hapusPlanDiagnosis() {
      let list_diagnosis = [...this.plan_diagnosis_terpilih];
      this.plan_diagnosis_terpilih = list_diagnosis.filter(res => {
        return res.ID != this.plan_diagnosis_terpilih.ID
      });
      console.log(list_diagnosis)
      this.$store.dispatch('tambahDataPlanDiagnosis', this.plan_diagnosis_terpilih)
      localStorage.setItem('plan_diagnosis_terpilih', JSON.stringify(this.plan_diagnosis_terpilih))
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
    height: 270px;
  }

  .kiri {
    height: 169px;
  }

  .plan-card-kotak {
    border-radius: 0px;
  }

  a {
    text-decoration: none;
  }

  .plan-hover-atas {
    background-image: -webkit-linear-gradient(left,#056644,#05AC72,#0AD48B);
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
    margin-bottom: 0.5rem !important;
    border-radius: 0.35rem !important;
  }
</style>
