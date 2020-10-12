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
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">

                  <div class="card mb-2">
                    <div class="card-body">
                      <p>Racikan</p>
                    </div>
                  </div>

                  <div class="card">
                    <div class="card-body">
                      <p>Obat</p>
                    </div>
                  </div>

                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary">Save changes</button>
                </div>
              </div>
            </div>
          </div>
        </tbody>
      </table>
      <!-- </form> -->

      <!-- Modal Proses -->
      <div class="modal fade" id="proses_rekmed" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Proses Pasien</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-success">
              Pastikan pak dokter udah siap ya!
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" @click="proses_pasien()" class="btn btn-success">Proses</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal Hapus -->
      <div class="modal fade" id="hapus_antrian" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Hapus Antrian Pasien</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-danger">
              Yakin nih mau hapus aku?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-danger">Hapus</button>
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

</style>
