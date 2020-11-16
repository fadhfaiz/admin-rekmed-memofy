<!-- eslint-disable -->
<template>
  <div class="obat">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">
      <!-- Infodata -->
      <!-- <InfoData /> -->
      <!--  <h3>ID Pasien : {{ pasien_rekmed.ID }}  </h3>
      <h3>Nama Pasien : {{ pasien_rekmed.nama}}</h3>
      <br> -->
      <h2 class="my-3 font-weight-bold">Form Resep Dokter</h2>
      <div class="row mb-4">
        <div class="col col-md-4">
            <div class="card border-left-primary shadow-none">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="text-md font-weight-bold text-primary text-uppercase"> NAMA : {{ pasien_rekmed.nama}}</div>
               </div>
             </div>
            </div>
         </div>
         <div class="col col-md-3">
            <div class="card border-left-primary shadow-none">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                 <div class="text-md font-weight-bold text-primary text-uppercase">ID PASIEN : {{ pasien_rekmed.ID }}</div>
                </div>
              </div>
             </div>
        </div>
        <div class="col col-md-3">
          <button type="button" class="btn btn-sm btn-primary riwayat-medis" data-toggle="modal" data-target="#riwayatMedis">
            Riwayat Medis
          </button>
        </div>
      </div>
      <div class="card">
        <div class="card-body plan-card-kotak">
          <div class="row">
            <div class="col-md-12 mb-3">
              <div class="card-header font-weight-bold bg-white text-dark">
                Obat
              </div>
              <div>
                <div class="row my-3 mx-2" v-for="(resep, index) in obat" v-bind:key="index">
                  <div class="col-4">
                    <input type="text" class="form-control" v-model="resep.nama_obat" placeholder="Nama Obat">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" v-model="resep.signa" placeholder="Signa">
                  </div>
                  <div class="col-3">
                    <input type="text" class="form-control" v-model="resep.jumlah" placeholder="Jumlah">
                  </div>
                  <div class="col-1">
                    <button type="button" @click="hapusResep(resep.id_obat, index)" class="btn btn-danger"><i style="float: left;"
                        class="fa fa-times"></i></button>
                  </div>
                </div>
              </div>
              <div class="row my-3 mx-2">
                <div class="col-4">
                    <input type="text" class="form-control" @click="tambahResep()" placeholder="Nama Obat" readonly>
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder="Signa" readonly>
                  </div>
                  <div class="col-3">
                    <input type="text" class="form-control" placeholder="Jumlah" readonly>
                  </div>
                  
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row my-3">
        <div class="col-8"></div>
        <div class="col-4">
          <button type="button" @click="simpanObat()" class="btn btn-info  float-right">Simpan dan tambah racikan</button>
        </div>
      </div>
      <!-- Modal Riwayat Medis -->
            <div class="modal fade" id="riwayatMedis" tabindex="-1" aria-labelledby="exampleModalLabel"
              aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                style="max-width: 100% !important; width: 90% !important;">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Riawayat Medis</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
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
                  <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="window.print();">Cetak invoice</button>
                  </div> -->
                </div>
              </div>
            </div>
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
    </div>

  </div>
</template>
<script>
/*eslint-disable*/
  // @ is an alias to /src
  import SidebarNav from '@/components/SidebarNav.vue'
  //import InfoData from '@/components/InfoData.vue'

  export default {
    name: 'obat',
    components: {
      SidebarNav,
    },
    data() {
      return {
        pasien_rekmed : [],
        obat : [{
          id_obat : Math.random(),
          nama_obat : '',
          jumlah : '',
          signa : ''
        }],
        tampil_obat : [],
        subjektif : [] 
      }
    },
    async created() {
      const getData = (x) => {
        let y = localStorage.getItem(x);
        return JSON.parse(y) || [];
      }
      this.pasien_rekmed = getData('pasien');
      //this.subjektif = getData('subjective');

      //console.log(this.subjektif)
    },
    methods: {
      tambahResep() {
        this.tampil_obat = [...this.obat];
        this.obat.push({
          //id_pasien : this.pasien_rekmed.ID,
          id_obat : Math.random(),
          nama_obat : '',
          jumlah : '',
          signa : ''
        })

        this.$store.dispatch('tambahDataObat', this.tampil_obat);
        localStorage.setItem('obat', JSON.stringify(this.tampil_obat));
        console.log('obat',this.tampil_obat)
      },
      hapusResep(id_obat,index) {
        this.obat.id_obat = id_obat
        this.obat.splice(index,1)

        this.tampil_obat = [...this.obat]
        this.$store.dispatch('tambahDataObat', this.tampil_obat);
        localStorage.setItem('obat', JSON.stringify(this.tampil_obat));
        console.log('obat hapus',this.tampil_obat)

      },
      simpanObat() {
        this.tampil_obat = [...this.obat]
        this.$store.dispatch('tambahDataObat', this.tampil_obat);
        localStorage.setItem('obat', JSON.stringify(this.tampil_obat));
        console.log('obat',this.tampil_obat)

        this.$router.push('/racikan')
      }
    }
  }

</script>
<style>
  /* .obat_scroll {
    overflow-y: scroll;
    height: 300px;
  } */

  .plan-card-kotak {
    border-radius: 0px;
  }

  .cari {
    height: 150px;
  }

  a {
    text-decoration: none;
  }

  .card {
    /* border: 0px !important; */
    margin-bottom: 0.5rem !important;
    border-radius: 0.35rem !important;
  }

</style>
