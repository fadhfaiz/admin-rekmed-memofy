<!-- eslint-disable -->
<template>
  <div class="dashboard">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- InfoData -->
      <!-- <InfoData/> -->

      <h2 class="my-3 font-weight-bold">Riwayat Medis</h2>
      <!-- <form> -->
      <!-- <div class="form-inline mb-3">
          <input type="text" class="form-control mr-2" style="width: 54rem;" id="cari_data_pasien" placeholder="Cari data pasien">
          <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah data <i class="fa fa-plus-circle"></i></button></router-link>
        </div> -->

      <table class="table table-hover table-bordered">
        <thead>
          <tr class="text-center bg-dark" style="color: white;">
            <th scope="col">Tanggal</th>
            <th scope="col">Objektif</th>
            <th scope="col">Asesmen</th>
            <th scope="col">Rencana</th>
            <th scope="col">Resep</th>
            <th scope="col">Detail</th>
          </tr>
        </thead>
        <!-- <tbody>
            <tr v-for="(row, index) in list_riwayat" :key="index">
              <th scope="row" class="text-center">{{ row.tanggal_periksa }}</th>
              <td>{{ row.objektif }}</td>
              <td>{{ row.asesmen }}</td>
              <td>{{ row.rencana }}</td>
              <td>{{ row.resep }}</td>
            </tr>
          </tbody> -->
        <tbody>
          <tr>
            <th scope="row">01 September</th>
            <td class="text-center">Objektif 1</td>
            <td class="text-center">Assesment 1</td>
            <td>Rencana 1</td>
            <td>Resep 1</td>
            <td class="text-center">
              <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#riwayatModal">
                Detail Resep
              </button>
            </td>
          </tr>
          <tr>
            <th scope="row">02 November</th>
            <td class="text-center">Objektif 2</td>
            <td class="text-center">Assesment 2</td>
            <td>Rencana 2</td>
            <td>Resep 2</td>
            <td class="text-center">
              <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#riwayatModal">
                Detail Resep
              </button>
            </td>
          </tr>

          <!-- Modal Riwayat Medis -->
          <div class="modal fade" id="riwayatModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
              style="max-width: 100% !important; width: 90% !important;">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">

                  <div class="row">
                    <div class="col-md-6">
                      <div>
                        <table class="table table-sm table-borderless">
                          <tbody>
                            <tr>
                              <th>Nama</th>
                              <td>: Shofian Listya</td>
                            </tr>
                            <tr>
                              <th>Nomor Rekam Medis</th>
                              <td>: RM0004</td>
                            </tr>
                            <tr>
                              <th>Status BPJS</th>
                              <td>: Tidak</td>
                            </tr>
                            <tr>
                              <th>Tanggal</th>
                              <td>: 24 Oktober 2020</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <div>
                        <div class="card">
                          <ul class="list-group">
                            <li class="list-group-item font-weight-bold text-center">Subjektif</li>
                            <div class="px-5" v-for="(sub, index) in subjektif" v-bind:key="index">
                              <span>{{ index+1 }}. {{ sub.subjective }}</span><br>
                            </div>
                            <li class="list-group-item font-weight-bold text-center">Objektif</li>
                            <div class="px-5 my-2" v-for="(obj, index) in objektif" v-bind:key="index">
                              <span> Nadi : {{ obj.nadi }}</span><br>
                              <span> Tekanan Darah : {{ obj.tekanan_darah }}</span><br>
                              <span> Suhu Tubuh : {{ obj.suhu_tubuh }}</span><br>
                              <span> Respirator Rate : {{ obj.respirator_rate }}</span><br>
                              <span> Berat Badan : {{ obj.berat_badan }}</span><br>
                              <span> Tinggi Badan : {{ obj.tinggi_badan }}</span><br>
                              <span> Hasil Pemeriksaan : {{ obj.hasil_pemeriksaan }}</span>
                            </div>
                            <li class="list-group-item font-weight-bold text-center">Assesment</li>
                            <div class="px-5" v-for="(ass, index) in assesment" v-bind:key="index">
                              <span>{{ index+1 }}. {{ ass.nama_diagnosis }}</span><br>
                            </div>
                            <li class="list-group-item font-weight-bold text-center">Planning</li>
                            <li class="list-group-item">Rencana Diagnostik</li>
                            <div class="px-5" v-for="(diag, index) in plan_diagnosis" v-bind:key="index">
                              <span>{{ index+1 }}. {{ diag.nama_diagnosis }}</span><br>
                            </div>
                            <li class="list-group-item">Rencana Terapi</li>
                            <li class="list-group-item">Rencana Edukasi</li>
                            <!-- <li class="list-group-item font-weight-bold text-center">Resep</li>
                            <li class="list-group-item">ALorem Ipsum</li>
                            <li class="list-group-item font-weight-bold text-center">Total Pembayaran</li>
                            <li class="list-group-item">ALorem Ipsum</li> -->
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6" id="invoice-payment">
                      <div>
                        <p class="h4 font-weight-bold text-center">Klink Citra Medika</p>
                        <hr>
                      </div>
                      <div>
                        <table class="table table-sm table-borderless">
                          <tbody>
                            <tr>
                              <th>Nama</th>
                              <td>: Shofian Carono</td>
                            </tr>
                            <tr>
                              <th>Nomor Rekam Medis</th>
                              <td>: RM0004</td>
                            </tr>
                          </tbody>
                        </table>
                        <hr>
                      </div>

                      <div>
                        <div class="h6 font-weight-bold text-center">Resep</div>
                        <hr>
                      </div>

                      <div>
                        <div class="h6 font-weight-bold text-center">Pembayaran</div>
                        <hr>
                      </div>

                    </div>
                  </div>

                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" onclick="window.print();">Cetak invoice</button>
                </div>
              </div>
            </div>
          </div>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
/*eslint-disable*/
  // @ is an alias to /src
  import SidebarNav from '@/components/SidebarNav.vue'
  import InfoData from '@/components/InfoData.vue'
  import axios from 'axios'

  export default {
    name: 'Riwayat_Medis',
    components: {
      SidebarNav,
      InfoData
    },
    props: [
      'ID'
    ],
    data() {
      return {
        list_riwayat: []
      }
    }
  }

</script>

<style>
  @media print {
    body * {
      visibility: hidden;
    }
    #invoice-payment, #invoice-payment * {
      visibility: visible;
    }
    #invoice-payment {
      position: absolute;
      left: 230px;
      top: 0px;
    }
  }
</style>
