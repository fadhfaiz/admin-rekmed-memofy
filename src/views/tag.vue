<!-- eslint-disable -->
<template>
<!-- Modal Riwayat Medis -->
                  <!-- <div class="modal fade" id="riwayatModal" tabindex="-1" aria-labelledby="exampleModalLabel"
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
                                    < <li class="list-group-item font-weight-bold text-center">Resep</li>
                                    <li class="list-group-item">ALorem Ipsum</li>
                                    <li class="list-group-item font-weight-bold text-center">Total Pembayaran</li>
                                    <li class="list-group-item">ALorem Ipsum</li>
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

                              <div>
                                <div class="h6 font-weight-bold text-center">Resep</div>
                                <hr>
                              </div>

                              <div>
                                <div class="h6 font-weight-bold text-center">Pembayaran</div>
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

                              <div>
                                <div class="h6 font-weight-bold text-center">Resep</div>
                                <hr>
                              </div>

                              <div>
                                <div class="h6 font-weight-bold text-center">Pembayaran</div>
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
                  </div> -->
                <!-- </tbody>
              </table>
            </div> -->
            <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="window.print();">Cetak invoice</button>
                  </div> -->
          <!-- </div>
        </div>
      </div> -->

      <!-- Modal Riwayat Medis -->
      <!-- <div class="modal fade" id="riwayatModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                          <td>: Shofiany Listya</td>
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
                        <! <li class="list-group-item font-weight-bold text-center">Resep</li>
                              <li class="list-group-item">ALorem Ipsum</li>
                              <li class="list-group-item font-weight-bold text-center">Total Pembayaran</li>
                              <li class="list-group-item">ALorem Ipsum</li>
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
                          <td>: Shofiany Carono</td>
                        </tr>
                        <tr>
                          <th>Nomor Rekam Medis</th>
                          <td>: RM0005</td>
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
      </div> -->
  <div class="tag">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">
     <form @submit.prevent="submit">
      <div class="form-group">
        <label for="">Nama Lengkap</label>
        <input type="text" v-model.trim="$v.name.$model" class="form-control" :class="{
        'is-invalid':$v.name.$error, 'is-valid':!$v.name.$invalid }">
        <div class="valid-feedback">name is valid !</div>
        <div class="invalid-feedback">
          <span v-if="!$v.name.required">name is required</span><br>
          <span v-if="!$v.name.minLength">name must have at least {{ $v.name.$params.minLength.min }} letters</span><br>
          <span v-if="!$v.name.maxLength">name must have at most {{ $v.name.$params.maxLength.min }} letters</span><
        </div>
      </div>
      <div class="form-group">
        <label for="">No Telp</label>
        <input type="text" v-model.trim="$v.phone.$model" class="form-control" :class="{'is-invalid': $v.phone.$error, 'is-valid':!$v.phone.$invalid }">
        <div class="valid-feedback">phone is valid !</div>
        <div class="invalid-feedback">
          <span v-if="!$v.phone.required">phone is required</span>
        </div>
      </div>
      <div class="form-group">
        <button class="btn btn-primary btn-sm">Daftar</button>
      </div>
    </form>
    </div>

  </div>
</template>
<script>
/*eslint-disable*/
  // @ is an alias to /src
  import SidebarNav from '@/components/SidebarNav.vue'
  import { required, minLength, maxLength, between } from 'vuelidate/lib/validators'

  export default {
    name: 'tag',
    components: {
      SidebarNav,
      VoerroTagsInput
    },
  data() {
    return {
      name: '',
      phone: 0,
    }
  },
    //MENDEFINISIKAN RULE VALIDASI 
  validations: {
    name: {
        required,
        minLength: minLength(4),
        maxLength: maxLength(50)
    },
    phone: {
        required,
        between: between(14, 50) //TAMBAHKAN FUNCTION notPhone
    }
  },
  methods: {
    submit() {
      this.$v.$touch(); //VALIDASI DIJALANKAN
      if(this.$v.$error) return //APABILA ERROR MAKA STOP
      alert('Form submitted') //APABILA BERHASIL MENAMPILKAN ALERT
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
