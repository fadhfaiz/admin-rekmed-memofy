<!-- eslint-disable -->
<template>
  <div class="racikan">
    <!-- Sidebar -->
    <SidebarNav />
    <!-- Page Content -->
    <div id="content" class="mb-3">
      <h2 class="my-3 font-weight-bold">Form Racikan Resep Dokter</h2>
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
      <div class="card mb-2 mt-2">
        <div class="card-body plan-card-kotak" id="card-racikan">
          <div class="card-header font-weight-bold bg-white text-dark">
            <div class="row">
              <div class="col-11">Racikan Tersimpan</div>
            </div>
          </div>
            <div class="my-3 text-center" v-if="tampil_racikan==''">
              <span>Data Kosong</span>
            </div>
          <div class="card my-3" v-else>
            <ul v-for="(list_racikan, indexRacikan) in tampil_racikan" v-bind:key="indexRacikan" class="list-group list-group-flush">
              <li class="list-group-item">
                <div class="row my-3">
                  <div class="col-3">
                    <span>M. F. Pulv : {{ list_racikan.pulv }}</span>
                  </div>
                  <div class="col-3">
                    <span>Signa : {{ list_racikan.signa }}</span>
                  </div>
                  <div class="col-1">
                    <button type="button" @click="hapusRacikan(list_racikan.id_racikan, indexRacikan)" class="btn btn-danger"><i style="float: left;"
                        class="fa fa-times"></i></button>
                  </div>
                </div>
                <!-- <span>Signa : {{ list_racikan.obat }}</span> -->
                <ul class="list-group" v-for="(list_obat, index) in list_racikan.obat" v-bind:key="index">
                  <li class="list-group-item">
                    <div class="row my-3">
                      <div class="col-4">
                        <span>Nama Obat : {{ list_obat.nama_obat }}</span>
                      </div>
                      <div class="col-4">
                        <span>Jumlah : {{ list_obat.jumlah }}</span>
                      </div>
                    </div>
                  </li>
                </ul>
              </li>
           </ul>
           <!-- <div v-else>
             <span>Data Kosong</span>
           </div> -->
          </div>
        </div>
      </div>
      <form>
      <div class="card mb-2 mt-2">
        <div class="card-body plan-card-kotak" id="card-racikan">
          <div class="row">
            <div class="col-md-12 mb-3">
              <div class="card-header font-weight-bold bg-dark text-white">
                <div class="row">
                  <div class="col-11">Racikan</div>
                </div>
              </div>
              <div class="obat_scroll">
                <div class="row my-3 mx-2" v-for="(racikan_obat, indexObat) in obat" v-bind:key="indexObat">
                  <div class="col-6">
                    <input type="text" class="form-control" v-model="racikan_obat.nama_obat" placeholder="Nama Obat">
                  </div>
                  <div class="col-5">
                    <input type="text" class="form-control" v-model="racikan_obat.jumlah" placeholder="Jumlah">
                  </div>
                  <div class="col-1">
                    <button type="button" @click="hapusObat(racikan_obat.id_obat, indexObat)" class="btn btn-danger"><i style="float: left;"
                        class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="row mx-2 my-3">
                  <div class="col-6">
                    <input type="text" class="form-control" @click="tambahObat()" placeholder="Nama Obat" readonly>
                  </div>
                  <div class="col-5">
                    <input type="text" class="form-control" placeholder="Jumlah" readonly>
                  </div>
                </div>
              </div>
              <!-- <div class="row my-3">
                <div class="mx-auto">
                  <button type="button" @click="tambahObat()" class="btn btn-success">Obat <i
                      class="fa fa-plus-circle"></i></button>
                </div>
              </div> -->
              <br>
              <div class="row my-3 mx-2">
                <div class="col-6">
                  <input type="text" class="form-control" v-model="racikan.pulv" placeholder="M. F. Pulv">
                </div>
                <div class="col-5">
                  <input type="text" class="form-control" v-model="racikan.signa" placeholder="Signa">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row my-3 mx-2">
        <div class="mx-auto">
          <button type="button" class="btn btn-success" @click="tambahRacikan()">Racikan <i
              class="fa fa-plus-circle"></i></button>
        </div>
      </div>
      </form>
      <div class="row my-3">
        <div class="col-9"></div>
        <div class="col-3">
          <button type="button" data-toggle="modal" data-target="#proses_invoice" class="btn btn-info">Simpan dan lanjutkan <i class="fa fa-arrow-right"></i></button>
        </div>
      </div>
      <!-- Modal proses selanjutnya -->
      <div class="modal fade" id="proses_invoice" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Total Pembayaran</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-dark">
              <div class="form-group">
                <input type="text" class="form-control" v-model="biaya" placeholder="biaya">
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-info" @click="prosesTransaksi()"
                data-dismiss="modal">Oke</button>
            </div>
          </div>
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
  import SidebarNav from '@/components/SidebarNav.vue'
  import axios from 'axios'

  export default {
    name: 'racikan',
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
        }],
        racikan : {
          id_racikan : '',
          pulv : '',
          signa : '',
          obat : []
        },
        biaya : '',
        kosong : [],
        tampil_racikan : [],
        tampil_obat : [],
        tampil_biaya : []
      }
    },
    async created() {
      const getData = (x) => {
        let y = localStorage.getItem(x);
        return JSON.parse(y) || [];
      }
      this.pasien_rekmed = getData('pasien');
      //this.tampil_racikan = getData('racikan');

      //console.log('racikan', this.tampil_racikan)
    },
    methods: {
      tambahObat() {

        this.obat.push ({
          id_obat : Math.random(),
          nama_obat: '',
          jumlah: ''      
        })

        this.tampil_obat = [...this.obat];
        
        this.$store.dispatch('tambahDataRacikanObat', this.tampil_obat);
        localStorage.setItem('racikan_obat', JSON.stringify(this.tampil_obat));
        //console.log('tampil_obat',this.tampil_obat)
        //this.obat.push(racikan_obat)
      },
      tambahRacikan() {
        this.obat.push()

        this.tampil_obat = [...this.obat];

        let racikan = {
          'id_racikan' : Math.random(),
          'pulv' : this.racikan.pulv,
          'signa' : this.racikan.signa,
          'obat' : [...this.tampil_obat]
        }

        //console.log(this.racikan.pulv)

        //this.tambahObat()
        this.tampil_racikan.push(racikan)

        //this.tampil_racikan = [...racikan];
        //this.racikan.obat.nama_obat = ''
        this.racikan.pulv = ''
        this.racikan.signa = ''
        this.obat = [...this.kosong]
        console.log('obat',this.tampil_obat)
      
        this.$store.dispatch('tambahDataRacikan', this.tampil_racikan);
        localStorage.setItem('racikan', JSON.stringify(this.tampil_racikan));

        //let obattt = [...this.tampil_racikan.obat]
        
        console.log('tampil_racikan',this.tampil_racikan)
        //console.log('obatt', obattt)

      },
      hapusObat(id, indexObat) {
        this.tampil_obat.id_obat = id
        this.obat.splice(indexObat, 1);

        this.tampil_obat = [...this.obat]
        this.$store.dispatch('tambahDataRacikanObat', this.tampil_obat);
        localStorage.setItem('racikan_obat', JSON.stringify(this.tampil_obat));
        console.log('tampil_obat hapus',this.tampil_obat)
      },
      hapusRacikan(id_racikan, indexRacikan) {
        this.tampil_racikan.id_racikan = id_racikan

        let list_racikan = [...this.tampil_racikan];
        this.tampil_racikan = list_racikan.filter(res => {
          return res.id_racikan != this.tampil_racikan.id_racikan
        });

        this.$store.dispatch('tambahDataRacikan', this.tampil_racikan);
        localStorage.setItem('racikan', JSON.stringify(this.tampil_racikan));

        //let obattt = [...this.tampil_racikan.obat]
        
        console.log('tampil_racikan hapus',this.tampil_racikan)
      },
      async loadPasien(id = null) {
        if (id) {
          return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get/' + id).then(res => res.data)
        } else {
          return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get').then(res => res.data)
        }
      },
      async prosesTransaksi() {
        let pasien = await this.loadPasien(this.pasien_rekmed.ID)
        if (pasien) {
          let temp_biaya = {
            'biaya' : this.biaya
          }
          this.tampil_biaya.push(temp_biaya)
          this.$store.dispatch('simpanBiaya', this.tampil_biaya)
          localStorage.setItem('biaya', JSON.stringify(this.tampil_biaya))

          console.log(this.tampil_biaya)

          this.$store.dispatch('simpanDataPasien', pasien)
          localStorage.setItem('pasien', JSON.stringify(pasien));
          this.$router.push('/invoice')
        }
      }
    }
  }

</script>
<style>
  /*eslint-disable*/
  /* .obat_scroll {
    overflow-y: scroll;
    height: 200px;
  } */

  .card {
    border: 1px solid #eeeeee;
  }

  #card-racikan {
    border: 0.5px solid #bdbdbd !important;
    border-radius: 0.35rem !important;
  }

  .card-body {
    padding: 6px 12px;
  }

</style>
