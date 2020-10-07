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
                          <input type="text" th scope="col" style="width: 19rem;" class="form-control mr-3"
                            id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="keluhan_pasien">
                          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah <i class="fa fa-plus-circle"></i></button></router-link>
                        </div>
                        <div class="plan_form kiri">
                          <table v-if="keluhan_pasien != ''" class="table table-hover table-borderless table-sm">
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
                      Rencana Diagnostik Terpilih
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
                            id="cari_data_pasien" placeholder="Cari / tambah terapi" v-model="keluhan_pasien">
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
          </div>
          <div class="card plan-card-kotak">
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

export default {
  name: 'plan',
  components: {
    SidebarNav
  },
  data () {
    return {
      pasien : [
        { Rekam_Medis: 201801, Harga_Rekmed: 12000 },
        { Rekam_Medis: 201802, Harga_Rekmed: 12000 },
        { Rekam_Medis: 201803, Harga_Rekmed: 12000 },
        { Rekam_Medis: 201804, Harga_Rekmed: 12000 },
        { Rekam_Medis: 201805, Harga_Rekmed: 12000 },
        { Rekam_Medis: 201806, Harga_Rekmed: 12000 }
      ],
      keluhan_pasien : '',
      pasien_rekmed : []
    }
  },
  async created() {
    const pasienRekmed = (pasien) => {
      let y = localStorage.getItem('pasien');
      return JSON.parse(y) || [];
    }
    this.pasien_rekmed = pasienRekmed('pasien_rekmed');
    console.log('pasien_rekmed',this.pasien_rekmed)
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
