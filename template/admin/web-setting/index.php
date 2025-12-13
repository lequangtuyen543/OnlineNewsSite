<?php
require_once(BASE_PATH . "/template/admin/layouts/head-tag.php");
?>


        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h5 "><i class="fas fa-newspaper"></i> Cài đặt Web</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <a role="button" href="<?= url('admin/web-setting/set') ?>" class="btn btn-sm btn-success">Chỉnh sửa cài đặt Web</a>
        </div>
    </div>
    <section class="table-responsive">
        <table class="table table-striped table-sm">
            <caption>Cài đặt Web</caption>
            <thead>
                <tr>
                    <th>Tên</th>
                    <th>Thông tin</th>
                </tr>
            </thead>
            <tbody>

            <tr>
                <td>Tiêu đề</td>
                <td><?= $setting['title']; ?></td>
            </tr>
            <tr>
                <td>Mô tả</td>
                <td><?= $setting['description']; ?></td>
            </tr>
            <tr>
                <td>Từ khóa</td>
                <td><?= $setting['keywords']; ?></td>
            </tr>
            <tr>
                <td>Logo</td>
                <td><img src="<?= asset($setting['logo']); ?>" alt="" width="100px" height="100px"></td>
            </tr>
            <tr>
                <td>Icon</td>
                <td><img src="<?= asset($setting['icon']); ?>" alt="" width="100px" height="100px"</td>
            </tr>
            </tbody>
        </table>
    </section>


    <?php
require_once(BASE_PATH . "/template/admin/layouts/footer.php");
?>