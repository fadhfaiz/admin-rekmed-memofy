<!-- eslint-disable -->
<template>
  <div class="plan">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->

      <h2 class="my-3 font-weight-bold">Form Plan</h2>

      <small class="text-danger font-weight-bold mb-3">* Klik panel lain untuk membuka form tersebut.</small>

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
                      <div class="card-header font-weight-bold">
                        Daftar Diagnosis
                      </div>
                      <div class="card-body">
                        <div class="form-inline mb-4">
                          <input type="text" th scope="col" style="width: 17rem;" class="form-control mr-1"
                            id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="keluhan_pasien">
                          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah
                              data <i class="fa fa-plus-circle"></i></button></router-link>
                        </div>
                        <div class="assesment_terpilih kiri">
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
                    <div class="card-header font-weight-bold">
                      Assesment Terpilih
                    </div>
                    <div class="card-body assesment_terpilih kanan">
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
                  <div class="col-md-6">
                    <div class="card">
                      <div class="card-header font-weight-bold">
                        Daftar Diagnosis
                      </div>
                      <div class="card-body">
                        <div class="form-inline mb-4">
                          <input type="text" th scope="col" style="width: 17rem;" class="form-control mr-1"
                            id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="keluhan_pasien">
                          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah
                              data <i class="fa fa-plus-circle"></i></button></router-link>
                        </div>
                        <div class="assesment_terpilih kiri">
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
                    <div class="card-header font-weight-bold">
                      Assesment Terpilih
                    </div>
                    <div class="card-body assesment_terpilih kanan">
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
                      <div class="card-header font-weight-bold">
                        Daftar Diagnosis
                      </div>
                      <div class="card-body">
                        <div class="form-inline mb-4">
                          <input type="text" th scope="col" style="width: 17rem;" class="form-control mr-1"
                            id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="keluhan_pasien">
                          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah
                              data <i class="fa fa-plus-circle"></i></button></router-link>
                        </div>
                        <div class="assesment_terpilih kiri">
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
                    <div class="card-header font-weight-bold">
                      Assesment Terpilih
                    </div>
                    <div class="card-body assesment_terpilih kanan">
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
          </div>
        </div>
      </div>
    </div>
    <!-- </div> -->
  </div>
</template>

<script>
// eslint-disable
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'

export default {
  name: 'plan',
  components: {
    SidebarNav
  },
  data () {
    return {
      pasien: [
        { Rekam_Medis: 201801 },
        { Rekam_Medis: 201802 },
        { Rekam_Medis: 201803 },
        { Rekam_Medis: 201804 },
        { Rekam_Medis: 201805 },
        { Rekam_Medis: 201806 }
      ],
      keluhan_pasien: ''
    }
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
    height: 300px;
  }

  .plan-card-kotak {
    border-radius: 0px;
  }

  a {
    text-decoration: none;
  }

  .plan-hover-atas {
    background-color: #28a745;
    border-radius: 0px !important;
    color: #fff !important;
  }

  .plan-hover-atas:hover {
    background-color: #15c73c;
  }

</style>
