<template>
  <div class="invoice">
    <!-- Sidebar -->
    <SidebarNav />
    <div id="content">
      <div class="row">
        <div class="col-md-6">
          <div>
            <table class="table table-sm table-borderless">
              <tbody>
                <tr>
                  <th>Nama</th>
                  <td>: Insan Carono</td>
                </tr>
                <tr>
                  <th>Nomor Rekam Medis</th>
                  <td>: RM001</td>
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
              <li class="list-group-item">ALorem Ipsum</li>
              <li class="list-group-item font-weight-bold text-center">Objektif</li>
              <li class="list-group-item">ALorem Ipsum</li>
              <li class="list-group-item font-weight-bold text-center">Assesment</li>
              <li class="list-group-item">ALorem Ipsum</li>
              <li class="list-group-item font-weight-bold text-center">Planning</li>
              <li class="list-group-item">ALorem Ipsum</li>
              <li class="list-group-item font-weight-bold text-center">Resep</li>
              <li class="list-group-item">ALorem Ipsum</li>
              <li class="list-group-item font-weight-bold text-center">Total Pembayaran</li>
              <li class="list-group-item">ALorem Ipsum</li>
            </ul>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div>
            <p class="h4 font-weight-bold text-center">Klink Citra Medika</p><hr>
          </div>
          <div>
            <table class="table table-sm table-borderless">
              <tbody>
                <tr>
                  <th>Nama</th>
                  <td>: Insan Carono</td>
                </tr>
                <tr>
                  <th>Nomor Rekam Medis</th>
                  <td>: RM001</td>
                </tr>
              </tbody>
            </table>
            <hr>
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
  export default {
    name: 'invoice',
    components: {
      SidebarNav
    }
  }
</script>

