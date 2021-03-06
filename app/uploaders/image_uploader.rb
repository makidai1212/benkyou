class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
    include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # storage :file
  # S3に保存するやつ
  # if Rails.env.production?
    storage :fog # 本番環境のみ
  # else
  #  storage :file # 本番環境以外
  # end
  # 画像の上限を640x480にする
  process :resize_to_limit => [640, 480]
  # 保存形式をJPGにする
  process :convert => 'jpg'
  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_limit => [300, 300]
  end
  version :thumb100 do
    process :resize_to_limit => [100, 100]
  end
  version :thumb30 do
    process :resize_to_limit => [30, 30]
  end
  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  # ファイル名を日付にするとタイミングのせいでサムネイル名がずれる
  #ファイル名はランダムで一意になる
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end