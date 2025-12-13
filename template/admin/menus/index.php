<?php

        require_once(BASE_PATH . '/template/admin/layouts/head-tag.php');


?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h5"><i class="fas fa-newspaper"></i> Thông tin</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <a role="button" href="<?= url('admin/menu/create') ?>" class="btn btn-sm btn-success">Tạo</a>
        </div>
    </div>
    <section class="table-responsive">
        <table class="table table-striped table-sm">
            <caption>Danh sách các thông tin</caption>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Tên</th>
                    <th>url</th>
                    <th>ID cha</th>
                    <th>Cài đặt</th>
                </tr>
            </thead>
            <tbody>
             
            <?php foreach ($menus as $key => $menu) { ?>
                <tr>
                    <td>
                      <?= $key += 1 ?>
                    </td>
                    <td>
                    <?= $menu['name'] ?>
                    </td>
                    <td>
                    <?= $menu['url'] ?>
                    </td>
                    <td>
                    <?= $menu['parent_id'] == null ? 'main menu' : $menu['parent_name'] ?>
                    </td>
                    <td>
                <a role="button" class="btn btn-sm btn-primary text-white" href="<?= url('admin/menu/edit/'.$menu['id']) ?>">Sửa</a>
                <a role="button" class="btn btn-sm btn-danger text-white" href="<?= url('admin/menu/delete/'.$menu['id']) ?>">Xóa</a>
                </td>
                </tr>

                <?php } ?>

                </tbody>
                </table>
                </section>

    <?php

        require_once(BASE_PATH . '/template/admin/layouts/footer.php');


?>