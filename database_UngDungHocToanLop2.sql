CREATE DATABASE BTL_Mobile_UngDungHocToanLop2
USE BTL_Mobile_UngDungHocToanLop2

-- Tạo bảng người dùng
CREATE TABLE NguoiDung (
    IDNguoiDung VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    TruongHoc NVARCHAR(100),
    Email NVARCHAR(100),
    MatKhau NVARCHAR(100),
    VaiTro NVARCHAR(50),
    NgayTao DATETIME DEFAULT GETDATE()
);

-- Tạo bảng khoá học
CREATE TABLE Khoahoc (
    IDKhoaHoc VARCHAR(10) PRIMARY KEY,
    TenKhoaHoc NVARCHAR(100),
    MoTa NVARCHAR(255),
    IDNguoiDung VARCHAR(10),
    FOREIGN KEY (IDNguoiDung) REFERENCES NguoiDung(IDNguoiDung)
);

-- Tạo bảng bài thi
CREATE TABLE BaiThi (
    IDBaiThi VARCHAR(10) PRIMARY KEY,
    NoiDungBaiThi NVARCHAR(255),
    SoCauHoi INT,
    CapDo NVARCHAR(50),
    ThoiGianLamBai INT,  -- Thời gian làm bài tính bằng giây
    IDKhoaHoc VARCHAR(10),
    FOREIGN KEY (IDKhoaHoc) REFERENCES Khoahoc(IDKhoaHoc)
);

-- Tạo bảng câu hỏi
CREATE TABLE NganHangCauHoi (
    IDCauHoi VARCHAR(10) PRIMARY KEY,
    NoiDung NVARCHAR(255),
    IDBaiThi VARCHAR(10),
    FOREIGN KEY (IDBaiThi) REFERENCES BaiThi(IDBaiThi)
);

-- Tạo bảng đáp án
CREATE TABLE DapAn (
    IDDapAn VARCHAR(10) PRIMARY KEY,
    NoiDung NVARCHAR(255),
    IDCauHoi VARCHAR(10),
    IDDapAnDung VARCHAR(10),
    FOREIGN KEY (IDCauHoi) REFERENCES NganHangCauHoi(IDCauHoi),
	FOREIGN KEY (IDDapAnDung) REFERENCES DapAn(IDDapAn)
);

-- Tạo bảng buổi học
CREATE TABLE BuoiHoc (
    IDBuoiHoc VARCHAR(10) PRIMARY KEY,
    TenBuoiHoc NVARCHAR(100),
    VideoBaiGiang NVARCHAR(MAX),  -- Video bài giảng
    IDKhoaHoc VARCHAR(10),
    GhiChu NVARCHAR(255),
    NgayHoc DATETIME,
    IDNguoiDung VARCHAR(10),
    FOREIGN KEY (IDKhoaHoc) REFERENCES Khoahoc(IDKhoaHoc),
    FOREIGN KEY (IDNguoiDung) REFERENCES NguoiDung(IDNguoiDung)
);

-- Tạo bảng tài liệu
CREATE TABLE TaiLieu (
    IDTaiLieu VARCHAR(10) PRIMARY KEY,
    TenTaiLieu NVARCHAR(100),
    FileTaiLieu NVARCHAR(MAX),  -- File tài liệu
    IDBuoiHoc VARCHAR(10),
    FOREIGN KEY (IDBuoiHoc) REFERENCES BuoiHoc(IDBuoiHoc)
);

-- Tạo bảng kết quả thi
CREATE TABLE KetQuaThi (
    IDKetQua VARCHAR(10) PRIMARY KEY,
    IDBaiThi VARCHAR(10),
    IDNguoiDung VARCHAR(10),
    NgayThi DATETIME,
    DiemThi DECIMAL(5, 2),
    FOREIGN KEY (IDBaiThi) REFERENCES BaiThi(IDBaiThi),
    FOREIGN KEY (IDNguoiDung) REFERENCES NguoiDung(IDNguoiDung)
);

-- Tạo bảng đánh giá
CREATE TABLE DanhGia (
    IDDanhGia VARCHAR(10) PRIMARY KEY,
    IDNguoiDung VARCHAR(10),
    DiemDanhGia INT CHECK (DiemDanhGia BETWEEN 1 AND 5),
    BinhLuan NVARCHAR(255),      
    NgayTao DATETIME DEFAULT GETDATE(),  
    IDKhoaHoc VARCHAR(10),       
    FOREIGN KEY (IDNguoiDung) REFERENCES NguoiDung(IDNguoiDung),
    FOREIGN KEY (IDKhoaHoc) REFERENCES Khoahoc(IDKhoaHoc)
);
