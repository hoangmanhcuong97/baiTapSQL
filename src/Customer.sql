create database ManagerCustomer;
use managercustomer;
create table VatTu(
    id_vat_tu int not null primary key auto_increment,
    ma_vat_tu nchar(10),
    ten_vat_tu nvarchar(50),
    don_vi_tinh nvarchar(20),
    gia_tien float
);
create table TonKho(
    id_ton_kho int primary key not null auto_increment,
    vat_tu_id int,
    foreign key (vat_tu_id) references VatTu(id_vat_tu),
    so_luong_dau int default 0,
    tong_so_luong_nhap int default 0,
    tong_so_luong_xuat int default 0
);
create table NhaCungCap(
  id_nhacungcap int not null auto_increment primary key ,
  ma_nha_cung_cap nchar(10),
  ten_nha_cung_cap nvarchar(100),
  dia_chi nvarchar(100),
  so_dien_thoai int
);
create table DonDatHang(
    id_don_dat_hang int primary key not null auto_increment,
    ngay_dat_hang date,
    nha_cung_cap_id int,
    foreign key (nha_cung_cap_id) references NhaCungCap(id_nhacungcap)
);
create table PhieuNhap(
    id_phieu_nhap int primary key auto_increment not null ,
    ma_phieu_nhap nchar(10),
    ngay_nhap date,
    don_hang_id int,
    foreign key (don_hang_id) references DonDatHang(id_don_dat_hang)
);
create table PhieuXuat(
    id_phieu_xuat int auto_increment not null primary key ,
    ma_phieu_xuat nchar(10),
    ngay_xuat date,
    ten_khach_hang nvarchar(50)
);
create table ChiTietDonHang(
    id_chiTietDonHang int primary key auto_increment not null ,
    don_hang_id int,
    foreign key (don_hang_id) references DonDatHang(id_don_dat_hang),
    vat_tu_id int,
    foreign key (vat_tu_id) references VatTu(id_vat_tu),
    so_luong_dat int default 0
);
create table ChiTietPhieuNhap(
    id_chiTietPhieuNhap int auto_increment primary key not null ,
    phieu_nhap_id int,
    foreign key (phieu_nhap_id) references PhieuNhap(id_phieu_nhap),
    vat_tu_id int,
    foreign key (vat_tu_id) references VatTu(id_vat_tu),
    so_luong_nhap int,
    don_gia_nhap float,
    ghi_chu nvarchar(100)
);
create table ChiTietPhieuXuat(
    id_chiTietPhieuXuat int primary key not null auto_increment,
    phieu_xuat_id int,
    foreign key (phieu_xuat_id) references PhieuXuat(id_phieu_xuat),
    vat_tu_id int,
    foreign key (vat_tu_id) references VatTu(id_vat_tu),
    so_luong_xuat int,
    don_gia_xuat float,
    ghi_chu nvarchar(100)
);

alter table NhaCungCap
modify so_dien_thoai float;
update NhaCungCap set so_dien_thoai = 1234 where id_nhacungcap = 1;
update NhaCungCap set so_dien_thoai = 6969 where id_nhacungcap = 2;
update NhaCungCap set so_dien_thoai = 9996 where id_nhacungcap = 3;

#Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau:
# số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP as
    select count(phieu_nhap_id), ma_vat_tu , so_luong_nhap, don_gia_nhap, sum(don_gia_nhap)
    from ChiTietPhieuNhap
join VatTu v on ChiTietPhieuNhap.phieu_nhap_id = v.id_vat_tu;
drop view vw_CTPNHAP;