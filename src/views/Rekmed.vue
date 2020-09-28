<template>
  <div class="rekmed">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <InfoData />

      <h2 class="my-3 font-weight-bold">Data Rekam Medis Pasien</h2>

      <form>

          <div class="row mb-2">
            <div class="col">
              <input type="text" class="form-control" placeholder="Cari data">
            </div>
            <div class="col">
              <div class="form-group">
                <select class="form-control" id="exampleFormControlSelect1">
                  <option>Urut Berdasarkan</option>
                  <option>Usia</option>
                  <option>Nomor Rekam Medis</option>
                  <option>Tanggal Daftar</option>
                </select>
              </div>
            </div>
            <div class="col">
              <div class="form-group">
                <select class="form-control" id="exampleFormControlSelect1">
                  <option>Status BPJS</option>
                  <option>Ya</option>
                  <option>Tidak</option>
                </select>
              </div>
            </div>
          </div>

        <table class="table table-hover table-bordered">
          <thead>
            <tr class="text-center bg-success" style="color: white;">
              <th scope="col">ID Rekam Medis</th>
              <th scope="col">Nama Pasien</th>
              <th scope="col">Alamat</th>
              <th scope="col">Tanggal Daftar</th>
              <th scope="col">BPJS</th>
              <th scope="col">Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(row, index) in pasien" :key="index">
              <th scope="row" class="text-center">{{ row.id }}</th>
              <td>{{ row.nama_pasien }}</td>
              <td>{{ row.alamat_pasien }}</td>
              <td>{{ row.tgl_daftar }}</td>
              <td>{{ row.bpjs }}</td>
              <td class="text-center">
                <button class="btn btn-warning btn-sm mr-2">Update</button>
                <button class="btn btn-danger btn-sm" type="button" data-toggle="modal" data-target="#hapus_pasien">Hapus</button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>

      <!-- Modal Hapus -->
      <div class="modal fade" id="hapus_pasien" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Hapus Data Pasien</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-danger">
              Yakin nih mau hapus aku??
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
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
import InfoData from '@/components/InfoData.vue'

export default {
  name: 'rekmed',
  components: {
    SidebarNav,
    InfoData
  },
  data() {
    return {
      pasien : [
        { id : 201801, nama_pasien : 'Insan Carono', alamat_pasien : 'Racoon City', tgl_daftar : '30 Januari 2020', bpjs : 'Ya'},
        { id : 201802, nama_pasien : 'Insan Carono1', alamat_pasien : 'Racoon City', tgl_daftar : '30 Januari 2020', bpjs : 'Ya'},
        { id : 201803, nama_pasien : 'Insan Carono2', alamat_pasien : 'Racoon City', tgl_daftar : '30 Januari 2020', bpjs : 'Ya'}
      ]
    }
  }
}

</script>

<style>

</style>
