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
            <tr>
              <th scope="row" class="text-center">201801</th>
              <td>Insan Carono</td>
              <td>New York City</td>
              <td>30 Januari 2021</td>
              <td>Ya</td>
              <td class="text-center">
                <button class="btn btn-warning btn-sm mr-2">Update</button>
                <button class="btn btn-danger btn-sm" type="button" data-toggle="modal" data-target="#hapus_pasien">Hapus</button>
              </td>
            </tr>
            <tr>
              <th scope="row" class="text-center">201802</th>
              <td>Maya Intantri</td>
              <td>Racoon City</td>
              <td>06 Desember 2022</td>
              <td>Tidak</td>
              <td class="text-center">
                <button class="btn btn-warning btn-sm mr-2">Update</button>
                <button class="btn btn-danger btn-sm" type="button" data-toggle="modal" data-target="#hapus_pasien">Hapus</button>
              </td>
            </tr>
            <tr>
              <th scope="row" class="text-center">201803</th>
              <td>Faadihilah Ahnaf Faiz</td>
              <td>Jawa Selatan</td>
              <td>12 Oktober 2023</td>
              <td>Tidak</td>
              <td class="text-center">
                <button class="btn btn-warning btn-sm mr-2">Update</button>
                <button class="btn btn-danger btn-sm" type="button" data-toggle="modal" data-target="#hapus_pasien">Hapus</button>
              </td>
            </tr>
            <tr>
              <th scope="row" class="text-center">201804</th>
              <td>Wahyu Shofyan Listya</td>
              <td>Kalimantan Tenggara</td>
              <td>21 Agustus 2024</td>
              <td>Ya</td>
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
  }
}

</script>

<style>

</style>
