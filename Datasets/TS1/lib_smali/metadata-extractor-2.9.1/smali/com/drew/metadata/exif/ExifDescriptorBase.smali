.class public abstract Lcom/drew/metadata/exif/ExifDescriptorBase;
.super Lcom/drew/metadata/TagDescriptor;
.source "ExifDescriptorBase.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/drew/metadata/Directory;",
        ">",
        "Lcom/drew/metadata/TagDescriptor",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final SimpleDecimalFormatter:Ljava/text/DecimalFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final _allowDecimalRepresentationOfRationals:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 54
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0.#"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/metadata/exif/ExifDescriptorBase;->SimpleDecimalFormatter:Ljava/text/DecimalFormat;

    return-void
.end method

.method public constructor <init>(Lcom/drew/metadata/Directory;)V
    .registers 3
    .param p1    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    .local p1, "directory":Lcom/drew/metadata/Directory;, "TT;"
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 51
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_allowDecimalRepresentationOfRationals:Z

    .line 65
    return-void
.end method

.method private getUnicodeDescription(I)Ljava/lang/String;
    .registers 7
    .param p1, "tag"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v2, 0x0

    .line 304
    iget-object v3, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v3, p1}, Lcom/drew/metadata/Directory;->getByteArray(I)[B

    move-result-object v0

    .line 305
    .local v0, "bytes":[B
    if-nez v0, :cond_a

    .line 311
    :goto_9
    return-object v2

    .line 309
    :cond_a
    :try_start_a
    new-instance v3, Ljava/lang/String;

    const-string v4, "UTF-16LE"

    invoke-direct {v3, v0, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_14
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_14} :catch_16

    move-result-object v2

    goto :goto_9

    .line 310
    :catch_16
    move-exception v1

    .line 311
    .local v1, "ex":Ljava/io/UnsupportedEncodingException;
    goto :goto_9
.end method


# virtual methods
.method public get35mmFilmEquivFocalLengthDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 574
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0xa405

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 575
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_16

    const-string v1, "Unknown"

    goto :goto_c

    :cond_16
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-double v1, v1

    invoke-static {v1, v2}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFocalLengthDescription(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getApertureValueDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 727
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v3, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v4, 0x9202

    invoke-virtual {v3, v4}, Lcom/drew/metadata/Directory;->getDoubleObject(I)Ljava/lang/Double;

    move-result-object v0

    .line 728
    .local v0, "aperture":Ljava/lang/Double;
    if-nez v0, :cond_d

    .line 729
    const/4 v3, 0x0

    .line 731
    :goto_c
    return-object v3

    .line 730
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/drew/imaging/PhotographicConversions;->apertureToFStop(D)D

    move-result-wide v1

    .line 731
    .local v1, "fStop":D
    invoke-static {v1, v2}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFStopDescription(D)Ljava/lang/String;

    move-result-object v3

    goto :goto_c
.end method

.method public getBitsPerSampleDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 425
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x102

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 426
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bits/component/pixel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getColorSpaceDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 803
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0xa001

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 804
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 805
    const/4 v1, 0x0

    .line 810
    :goto_c
    return-object v1

    .line 806
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_17

    .line 807
    const-string v1, "sRGB"

    goto :goto_c

    .line 808
    :cond_17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0xffff

    if-ne v1, v2, :cond_23

    .line 809
    const-string v1, "Undefined"

    goto :goto_c

    .line 810
    :cond_23
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getComponentConfigurationDescription()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v7, 0x4

    .line 1082
    iget-object v5, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v6, 0x9101

    invoke-virtual {v5, v6}, Lcom/drew/metadata/Directory;->getIntArray(I)[I

    move-result-object v2

    .line 1083
    .local v2, "components":[I
    if-nez v2, :cond_e

    .line 1084
    const/4 v5, 0x0

    .line 1093
    :goto_d
    return-object v5

    .line 1085
    :cond_e
    const/4 v5, 0x7

    new-array v1, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, ""

    aput-object v6, v1, v5

    const/4 v5, 0x1

    const-string v6, "Y"

    aput-object v6, v1, v5

    const/4 v5, 0x2

    const-string v6, "Cb"

    aput-object v6, v1, v5

    const/4 v5, 0x3

    const-string v6, "Cr"

    aput-object v6, v1, v5

    const-string v5, "R"

    aput-object v5, v1, v7

    const/4 v5, 0x5

    const-string v6, "G"

    aput-object v6, v1, v5

    const/4 v5, 0x6

    const-string v6, "B"

    aput-object v6, v1, v5

    .line 1086
    .local v1, "componentStrings":[Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1087
    .local v0, "componentConfig":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_39
    array-length v5, v2

    invoke-static {v7, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    if-ge v3, v5, :cond_4f

    .line 1088
    aget v4, v2, v3

    .line 1089
    .local v4, "j":I
    if-lez v4, :cond_4c

    array-length v5, v1

    if-ge v4, v5, :cond_4c

    .line 1090
    aget-object v5, v1, v4

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1087
    :cond_4c
    add-int/lit8 v3, v3, 0x1

    goto :goto_39

    .line 1093
    .end local v4    # "j":I
    :cond_4f
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_d
.end method

.method public getCompressedAverageBitsPerPixelDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 986
    iget-object v2, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v3, 0x9102

    invoke-virtual {v2, v3}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v1

    .line 987
    .local v1, "value":Lcom/drew/lang/Rational;
    if-nez v1, :cond_e

    .line 988
    const/4 v2, 0x0

    .line 990
    :goto_d
    return-object v2

    .line 989
    :cond_e
    invoke-virtual {v1, v4}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v0

    .line 990
    .local v0, "ratio":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/drew/lang/Rational;->isInteger()Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-virtual {v1}, Lcom/drew/lang/Rational;->intValue()I

    move-result v2

    if-ne v2, v4, :cond_32

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bit/pixel"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_d

    :cond_32
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bits/pixel"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method public getCompressionDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 923
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x103

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 924
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_c

    .line 925
    const/4 v1, 0x0

    .line 969
    :goto_b
    return-object v1

    .line 926
    :cond_c
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_b2

    .line 969
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b

    .line 927
    :sswitch_2d
    const-string v1, "Uncompressed"

    goto :goto_b

    .line 928
    :sswitch_30
    const-string v1, "CCITT 1D"

    goto :goto_b

    .line 929
    :sswitch_33
    const-string v1, "T4/Group 3 Fax"

    goto :goto_b

    .line 930
    :sswitch_36
    const-string v1, "T6/Group 4 Fax"

    goto :goto_b

    .line 931
    :sswitch_39
    const-string v1, "LZW"

    goto :goto_b

    .line 932
    :sswitch_3c
    const-string v1, "JPEG (old-style)"

    goto :goto_b

    .line 933
    :sswitch_3f
    const-string v1, "JPEG"

    goto :goto_b

    .line 934
    :sswitch_42
    const-string v1, "Adobe Deflate"

    goto :goto_b

    .line 935
    :sswitch_45
    const-string v1, "JBIG B&W"

    goto :goto_b

    .line 936
    :sswitch_48
    const-string v1, "JBIG Color"

    goto :goto_b

    .line 937
    :sswitch_4b
    const-string v1, "JPEG"

    goto :goto_b

    .line 938
    :sswitch_4e
    const-string v1, "Kodak 262"

    goto :goto_b

    .line 939
    :sswitch_51
    const-string v1, "Next"

    goto :goto_b

    .line 940
    :sswitch_54
    const-string v1, "Sony ARW Compressed"

    goto :goto_b

    .line 941
    :sswitch_57
    const-string v1, "Packed RAW"

    goto :goto_b

    .line 942
    :sswitch_5a
    const-string v1, "Samsung SRW Compressed"

    goto :goto_b

    .line 943
    :sswitch_5d
    const-string v1, "CCIRLEW"

    goto :goto_b

    .line 944
    :sswitch_60
    const-string v1, "Samsung SRW Compressed 2"

    goto :goto_b

    .line 945
    :sswitch_63
    const-string v1, "PackBits"

    goto :goto_b

    .line 946
    :sswitch_66
    const-string v1, "Thunderscan"

    goto :goto_b

    .line 947
    :sswitch_69
    const-string v1, "Kodak KDC Compressed"

    goto :goto_b

    .line 948
    :sswitch_6c
    const-string v1, "IT8CTPAD"

    goto :goto_b

    .line 949
    :sswitch_6f
    const-string v1, "IT8LW"

    goto :goto_b

    .line 950
    :sswitch_72
    const-string v1, "IT8MP"

    goto :goto_b

    .line 951
    :sswitch_75
    const-string v1, "IT8BL"

    goto :goto_b

    .line 952
    :sswitch_78
    const-string v1, "PixarFilm"

    goto :goto_b

    .line 953
    :sswitch_7b
    const-string v1, "PixarLog"

    goto :goto_b

    .line 954
    :sswitch_7e
    const-string v1, "Deflate"

    goto :goto_b

    .line 955
    :sswitch_81
    const-string v1, "DCS"

    goto :goto_b

    .line 956
    :sswitch_84
    const-string v1, "JBIG"

    goto :goto_b

    .line 957
    :sswitch_87
    const-string v1, "SGILog"

    goto :goto_b

    .line 958
    :sswitch_8a
    const-string v1, "SGILog24"

    goto/16 :goto_b

    .line 959
    :sswitch_8e
    const-string v1, "JPEG 2000"

    goto/16 :goto_b

    .line 960
    :sswitch_92
    const-string v1, "Nikon NEF Compressed"

    goto/16 :goto_b

    .line 961
    :sswitch_96
    const-string v1, "JBIG2 TIFF FX"

    goto/16 :goto_b

    .line 962
    :sswitch_9a
    const-string v1, "Microsoft Document Imaging (MDI) Binary Level Codec"

    goto/16 :goto_b

    .line 963
    :sswitch_9e
    const-string v1, "Microsoft Document Imaging (MDI) Progressive Transform Codec"

    goto/16 :goto_b

    .line 964
    :sswitch_a2
    const-string v1, "Microsoft Document Imaging (MDI) Vector"

    goto/16 :goto_b

    .line 965
    :sswitch_a6
    const-string v1, "Lossy JPEG"

    goto/16 :goto_b

    .line 966
    :sswitch_aa
    const-string v1, "Kodak DCR Compressed"

    goto/16 :goto_b

    .line 967
    :sswitch_ae
    const-string v1, "Pentax PEF Compressed"

    goto/16 :goto_b

    .line 926
    :sswitch_data_b2
    .sparse-switch
        0x1 -> :sswitch_2d
        0x2 -> :sswitch_30
        0x3 -> :sswitch_33
        0x4 -> :sswitch_36
        0x5 -> :sswitch_39
        0x6 -> :sswitch_3c
        0x7 -> :sswitch_3f
        0x8 -> :sswitch_42
        0x9 -> :sswitch_45
        0xa -> :sswitch_48
        0x63 -> :sswitch_4b
        0x106 -> :sswitch_4e
        0x7ffe -> :sswitch_51
        0x7fff -> :sswitch_54
        0x8001 -> :sswitch_57
        0x8002 -> :sswitch_5a
        0x8003 -> :sswitch_5d
        0x8004 -> :sswitch_60
        0x8005 -> :sswitch_63
        0x8029 -> :sswitch_66
        0x8063 -> :sswitch_69
        0x807f -> :sswitch_6c
        0x8080 -> :sswitch_6f
        0x8081 -> :sswitch_72
        0x8082 -> :sswitch_75
        0x808c -> :sswitch_78
        0x808d -> :sswitch_7b
        0x80b2 -> :sswitch_7e
        0x80b3 -> :sswitch_81
        0x8765 -> :sswitch_84
        0x8774 -> :sswitch_87
        0x8775 -> :sswitch_8a
        0x8798 -> :sswitch_8e
        0x8799 -> :sswitch_92
        0x879b -> :sswitch_96
        0x879e -> :sswitch_9a
        0x879f -> :sswitch_9e
        0x87a0 -> :sswitch_a2
        0x884c -> :sswitch_a6
        0xfde8 -> :sswitch_aa
        0xffff -> :sswitch_ae
    .end sparse-switch
.end method

.method public getContrastDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 541
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa408

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "None"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Soft"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Hard"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCustomRenderedDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 615
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa401

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal process"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Custom process"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 73
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    sparse-switch p1, :sswitch_data_188

    .line 211
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 75
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getInteropIndexDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 77
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getInteropVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 79
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getOrientationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 81
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getResolutionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 83
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getYCbCrPositioningDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 85
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getXResolutionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 87
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getYResolutionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 89
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getImageWidthDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 91
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getImageHeightDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 93
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getBitsPerSampleDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 95
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getPhotometricInterpretationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 97
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getRowsPerStripDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 99
    :sswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getStripByteCountsDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 101
    :sswitch_49
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSamplesPerPixelDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 103
    :sswitch_4e
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getPlanarConfigurationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 105
    :sswitch_53
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getYCbCrSubsamplingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 107
    :sswitch_58
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getReferenceBlackWhiteDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 109
    :sswitch_5d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getWindowsAuthorDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 111
    :sswitch_62
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getWindowsCommentDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 113
    :sswitch_67
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getWindowsKeywordsDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 115
    :sswitch_6c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getWindowsSubjectDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 117
    :sswitch_71
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getWindowsTitleDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 119
    :sswitch_76
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getNewSubfileTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 121
    :sswitch_7b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSubfileTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 123
    :sswitch_80
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getThresholdingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 125
    :sswitch_85
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFillOrderDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 127
    :sswitch_8b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getExposureTimeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 129
    :sswitch_91
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getShutterSpeedDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 131
    :sswitch_97
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFNumberDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 133
    :sswitch_9d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getCompressedAverageBitsPerPixelDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 135
    :sswitch_a3
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSubjectDistanceDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 137
    :sswitch_a9
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getMeteringModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 139
    :sswitch_af
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 141
    :sswitch_b5
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFlashDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 143
    :sswitch_bb
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFocalLengthDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 145
    :sswitch_c1
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getColorSpaceDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 147
    :sswitch_c7
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getExifImageWidthDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 149
    :sswitch_cd
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getExifImageHeightDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 151
    :sswitch_d3
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFocalPlaneResolutionUnitDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 153
    :sswitch_d9
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFocalPlaneXResolutionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 155
    :sswitch_df
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFocalPlaneYResolutionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 157
    :sswitch_e5
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getExposureProgramDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 159
    :sswitch_eb
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getApertureValueDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 161
    :sswitch_f1
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getMaxApertureValueDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 163
    :sswitch_f7
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSensingMethodDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 165
    :sswitch_fd
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getExposureBiasDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 167
    :sswitch_103
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFileSourceDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 169
    :sswitch_109
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSceneTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 171
    :sswitch_10f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getComponentConfigurationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 173
    :sswitch_115
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getExifVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 175
    :sswitch_11b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFlashPixVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 177
    :sswitch_121
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIsoEquivalentDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 179
    :sswitch_127
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getUserCommentDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 181
    :sswitch_12d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getCustomRenderedDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 183
    :sswitch_133
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getExposureModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 185
    :sswitch_139
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getWhiteBalanceModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 187
    :sswitch_13f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getDigitalZoomRatioDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 189
    :sswitch_145
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->get35mmFilmEquivFocalLengthDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 191
    :sswitch_14b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSceneCaptureTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 193
    :sswitch_151
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getGainControlDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 195
    :sswitch_157
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getContrastDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 197
    :sswitch_15d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSaturationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 199
    :sswitch_163
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSharpnessDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 201
    :sswitch_169
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSubjectDistanceRangeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 203
    :sswitch_16f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getSensitivityTypeRangeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 205
    :sswitch_175
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getCompressionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 207
    :sswitch_17b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getJpegProcDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 209
    :sswitch_181
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getLensSpecificationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 73
    nop

    :sswitch_data_188
    .sparse-switch
        0x1 -> :sswitch_8
        0x2 -> :sswitch_d
        0xfe -> :sswitch_76
        0xff -> :sswitch_7b
        0x100 -> :sswitch_2b
        0x101 -> :sswitch_30
        0x102 -> :sswitch_35
        0x103 -> :sswitch_175
        0x106 -> :sswitch_3a
        0x107 -> :sswitch_80
        0x10a -> :sswitch_85
        0x112 -> :sswitch_12
        0x115 -> :sswitch_49
        0x116 -> :sswitch_3f
        0x117 -> :sswitch_44
        0x11a -> :sswitch_21
        0x11b -> :sswitch_26
        0x11c -> :sswitch_4e
        0x128 -> :sswitch_17
        0x200 -> :sswitch_17b
        0x212 -> :sswitch_53
        0x213 -> :sswitch_1c
        0x214 -> :sswitch_58
        0x829a -> :sswitch_8b
        0x829d -> :sswitch_97
        0x8822 -> :sswitch_e5
        0x8827 -> :sswitch_121
        0x8830 -> :sswitch_16f
        0x9000 -> :sswitch_115
        0x9101 -> :sswitch_10f
        0x9102 -> :sswitch_9d
        0x9201 -> :sswitch_91
        0x9202 -> :sswitch_eb
        0x9204 -> :sswitch_fd
        0x9205 -> :sswitch_f1
        0x9206 -> :sswitch_a3
        0x9207 -> :sswitch_a9
        0x9208 -> :sswitch_af
        0x9209 -> :sswitch_b5
        0x920a -> :sswitch_bb
        0x9286 -> :sswitch_127
        0x9c9b -> :sswitch_71
        0x9c9c -> :sswitch_62
        0x9c9d -> :sswitch_5d
        0x9c9e -> :sswitch_67
        0x9c9f -> :sswitch_6c
        0xa000 -> :sswitch_11b
        0xa001 -> :sswitch_c1
        0xa002 -> :sswitch_c7
        0xa003 -> :sswitch_cd
        0xa20e -> :sswitch_d9
        0xa20f -> :sswitch_df
        0xa210 -> :sswitch_d3
        0xa217 -> :sswitch_f7
        0xa300 -> :sswitch_103
        0xa301 -> :sswitch_109
        0xa401 -> :sswitch_12d
        0xa402 -> :sswitch_133
        0xa403 -> :sswitch_139
        0xa404 -> :sswitch_13f
        0xa405 -> :sswitch_145
        0xa406 -> :sswitch_14b
        0xa407 -> :sswitch_151
        0xa408 -> :sswitch_157
        0xa409 -> :sswitch_15d
        0xa40a -> :sswitch_163
        0xa40c -> :sswitch_169
        0xa432 -> :sswitch_181
    .end sparse-switch
.end method

.method public getDigitalZoomRatioDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 585
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0xa404

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 586
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    invoke-virtual {v0}, Lcom/drew/lang/Rational;->getNumerator()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1a

    const-string v1, "Digital zoom not used"

    goto :goto_c

    :cond_1a
    sget-object v1, Lcom/drew/metadata/exif/ExifDescriptorBase;->SimpleDecimalFormatter:Ljava/text/DecimalFormat;

    invoke-virtual {v0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getExifImageHeightDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 796
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0xa003

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 797
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pixels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getExifImageWidthDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 789
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0xa002

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 790
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pixels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getExifVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 676
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0x9000

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposureBiasDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 708
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0x9204

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 709
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_d

    .line 710
    const/4 v1, 0x0

    .line 711
    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " EV"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getExposureModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 605
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa402

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto exposure"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Manual exposure"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Auto bracket"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposureProgramDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 737
    const v0, 0x8822

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Manual control"

    aput-object v3, v1, v2

    const-string v2, "Program normal"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Aperture priority"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Shutter priority"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Program creative (slow program)"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Program action (high-speed program)"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Portrait mode"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Landscape mode"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposureTimeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 998
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0x829a

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 999
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " sec"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getFNumberDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1054
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0x829d

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 1055
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_d

    .line 1056
    const/4 v1, 0x0

    .line 1057
    :goto_c
    return-object v1

    :cond_d
    invoke-virtual {v0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFStopDescription(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getFileSourceDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 697
    const v0, 0xa300

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Film Scanner"

    aput-object v3, v1, v2

    const-string v2, "Reflection Print Scanner"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Digital Still Camera (DSC)"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFillOrderDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 480
    const/16 v0, 0x10a

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const-string v2, "Reversed"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 834
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v2, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v3, 0x9209

    invoke-virtual {v2, v3}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 836
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_d

    .line 837
    const/4 v2, 0x0

    .line 860
    :goto_c
    return-object v2

    .line 839
    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 841
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_53

    .line 842
    const-string v2, "Flash fired"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 847
    :goto_1f
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_34

    .line 848
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_59

    .line 849
    const-string v2, ", return detected"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 854
    :cond_34
    :goto_34
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_41

    .line 855
    const-string v2, ", auto"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 857
    :cond_41
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v2, v2, 0x40

    if-eqz v2, :cond_4e

    .line 858
    const-string v2, ", red-eye reduction"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 860
    :cond_4e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_c

    .line 844
    :cond_53
    const-string v2, "Flash did not fire"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1f

    .line 851
    :cond_59
    const-string v2, ", return not detected"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_34
.end method

.method public getFlashPixVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 682
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa000

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocalLengthDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 816
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0x920a

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 817
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    invoke-virtual {v0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFocalLengthDescription(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getFocalPlaneResolutionUnitDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 778
    const v0, 0xa210

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "(No unit)"

    aput-object v3, v1, v2

    const-string v2, "Inches"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "cm"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocalPlaneXResolutionDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 754
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v2, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v3, 0xa20e

    invoke-virtual {v2, v3}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 755
    .local v0, "rational":Lcom/drew/lang/Rational;
    if-nez v0, :cond_d

    .line 756
    const/4 v2, 0x0

    .line 758
    :goto_c
    return-object v2

    .line 757
    :cond_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFocalPlaneResolutionUnitDescription()Ljava/lang/String;

    move-result-object v1

    .line 758
    .local v1, "unit":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/drew/lang/Rational;->getReciprocal()Lcom/drew/lang/Rational;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez v1, :cond_30

    const-string v2, ""

    :goto_27
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_c

    :cond_30
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_27
.end method

.method public getFocalPlaneYResolutionDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 765
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v2, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v3, 0xa20f

    invoke-virtual {v2, v3}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 766
    .local v0, "rational":Lcom/drew/lang/Rational;
    if-nez v0, :cond_d

    .line 767
    const/4 v2, 0x0

    .line 769
    :goto_c
    return-object v2

    .line 768
    :cond_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFocalPlaneResolutionUnitDescription()Ljava/lang/String;

    move-result-object v1

    .line 769
    .local v1, "unit":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/drew/lang/Rational;->getReciprocal()Lcom/drew/lang/Rational;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez v1, :cond_30

    const-string v2, ""

    :goto_27
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_c

    :cond_30
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_27
.end method

.method public getGainControlDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 551
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa407

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "None"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Low gain up"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Low gain down"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "High gain up"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "High gain down"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageHeightDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 439
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x101

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 440
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pixels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getImageWidthDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 432
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x100

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 433
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pixels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getInteropIndexDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 224
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 226
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_b

    .line 227
    const/4 v1, 0x0

    .line 229
    :goto_a
    return-object v1

    :cond_b
    const-string v1, "R98"

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    const-string v1, "Recommended Exif Interoperability Rules (ExifR98)"

    goto :goto_a

    :cond_1a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method public getInteropVersionDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v0, 0x2

    .line 218
    invoke-virtual {p0, v0, v0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIsoEquivalentDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 665
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0x8827

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 668
    .local v0, "isoEquiv":Ljava/lang/Integer;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    :goto_13
    return-object v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public getJpegProcDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1099
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x200

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 1100
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_c

    .line 1101
    const/4 v1, 0x0

    .line 1106
    :goto_b
    return-object v1

    .line 1102
    :cond_c
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_34

    .line 1106
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b

    .line 1103
    :sswitch_2d
    const-string v1, "Baseline"

    goto :goto_b

    .line 1104
    :sswitch_30
    const-string v1, "Lossless"

    goto :goto_b

    .line 1102
    nop

    :sswitch_data_34
    .sparse-switch
        0x1 -> :sswitch_2d
        0xe -> :sswitch_30
    .end sparse-switch
.end method

.method public getLensSpecificationDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 515
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa432

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getLensSpecificationDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMaxApertureValueDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 717
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v3, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v4, 0x9205

    invoke-virtual {v3, v4}, Lcom/drew/metadata/Directory;->getDoubleObject(I)Ljava/lang/Double;

    move-result-object v0

    .line 718
    .local v0, "aperture":Ljava/lang/Double;
    if-nez v0, :cond_d

    .line 719
    const/4 v3, 0x0

    .line 721
    :goto_c
    return-object v3

    .line 720
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/drew/imaging/PhotographicConversions;->apertureToFStop(D)D

    move-result-wide v1

    .line 721
    .local v1, "fStop":D
    invoke-static {v1, v2}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getFStopDescription(D)Ljava/lang/String;

    move-result-object v3

    goto :goto_c
.end method

.method public getMeteringModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 903
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0x9207

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 904
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 905
    const/4 v1, 0x0

    .line 916
    :goto_c
    return-object v1

    .line 906
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_46

    .line 916
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    .line 907
    :sswitch_2e
    const-string v1, "Unknown"

    goto :goto_c

    .line 908
    :sswitch_31
    const-string v1, "Average"

    goto :goto_c

    .line 909
    :sswitch_34
    const-string v1, "Center weighted average"

    goto :goto_c

    .line 910
    :sswitch_37
    const-string v1, "Spot"

    goto :goto_c

    .line 911
    :sswitch_3a
    const-string v1, "Multi-spot"

    goto :goto_c

    .line 912
    :sswitch_3d
    const-string v1, "Multi-segment"

    goto :goto_c

    .line 913
    :sswitch_40
    const-string v1, "Partial"

    goto :goto_c

    .line 914
    :sswitch_43
    const-string v1, "(Other)"

    goto :goto_c

    .line 906
    :sswitch_data_46
    .sparse-switch
        0x0 -> :sswitch_2e
        0x1 -> :sswitch_31
        0x2 -> :sswitch_34
        0x3 -> :sswitch_37
        0x4 -> :sswitch_3a
        0x5 -> :sswitch_3d
        0x6 -> :sswitch_40
        0xff -> :sswitch_43
    .end sparse-switch
.end method

.method public getNewSubfileTypeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 446
    const/16 v0, 0xfe

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Full-resolution image"

    aput-object v3, v1, v2

    const-string v2, "Reduced-resolution image"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Single page of multi-page reduced-resolution image"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Transparency mask"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Transparency mask of reduced-resolution image"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Transparency mask of multi-page image"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Transparency mask of reduced-resolution multi-page image"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOrientationDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 282
    const/16 v0, 0x112

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Top, left side (Horizontal / normal)"

    aput-object v3, v1, v2

    const-string v2, "Top, right side (Mirror horizontal)"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Bottom, right side (Rotate 180)"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Bottom, left side (Mirror vertical)"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Left side, top (Mirror horizontal and rotate 270 CW)"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Right side, top (Rotate 90 CW)"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Right side, bottom (Mirror horizontal and rotate 90 CW)"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Left side, bottom (Rotate 270 CW)"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPhotometricInterpretationDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 399
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x106

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 400
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_c

    .line 401
    const/4 v1, 0x0

    .line 418
    :goto_b
    return-object v1

    .line 402
    :cond_c
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_40

    .line 418
    const-string v1, "Unknown colour space"

    goto :goto_b

    .line 403
    :sswitch_16
    const-string v1, "WhiteIsZero"

    goto :goto_b

    .line 404
    :sswitch_19
    const-string v1, "BlackIsZero"

    goto :goto_b

    .line 405
    :sswitch_1c
    const-string v1, "RGB"

    goto :goto_b

    .line 406
    :sswitch_1f
    const-string v1, "RGB Palette"

    goto :goto_b

    .line 407
    :sswitch_22
    const-string v1, "Transparency Mask"

    goto :goto_b

    .line 408
    :sswitch_25
    const-string v1, "CMYK"

    goto :goto_b

    .line 409
    :sswitch_28
    const-string v1, "YCbCr"

    goto :goto_b

    .line 410
    :sswitch_2b
    const-string v1, "CIELab"

    goto :goto_b

    .line 411
    :sswitch_2e
    const-string v1, "ICCLab"

    goto :goto_b

    .line 412
    :sswitch_31
    const-string v1, "ITULab"

    goto :goto_b

    .line 413
    :sswitch_34
    const-string v1, "Color Filter Array"

    goto :goto_b

    .line 414
    :sswitch_37
    const-string v1, "Pixar LogL"

    goto :goto_b

    .line 415
    :sswitch_3a
    const-string v1, "Pixar LogLuv"

    goto :goto_b

    .line 416
    :sswitch_3d
    const-string v1, "Linear Raw"

    goto :goto_b

    .line 402
    :sswitch_data_40
    .sparse-switch
        0x0 -> :sswitch_16
        0x1 -> :sswitch_19
        0x2 -> :sswitch_1c
        0x3 -> :sswitch_1f
        0x4 -> :sswitch_22
        0x5 -> :sswitch_25
        0x6 -> :sswitch_28
        0x8 -> :sswitch_2b
        0x9 -> :sswitch_2e
        0xa -> :sswitch_31
        0x8023 -> :sswitch_34
        0x804c -> :sswitch_37
        0x804d -> :sswitch_3a
        0x807c -> :sswitch_3d
    .end sparse-switch
.end method

.method public getPlanarConfigurationDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 367
    const/16 v0, 0x11c

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Chunky (contiguous for each subsampling pixel)"

    aput-object v3, v1, v2

    const-string v2, "Separate (Y-plane/Cb-plane/Cr-plane format)"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getReferenceBlackWhiteDescription()Ljava/lang/String;
    .registers 16
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v14, 0x4

    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 237
    iget-object v7, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v8, 0x214

    invoke-virtual {v7, v8}, Lcom/drew/metadata/Directory;->getIntArray(I)[I

    move-result-object v3

    .line 238
    .local v3, "ints":[I
    if-eqz v3, :cond_13

    array-length v7, v3

    const/4 v8, 0x6

    if-ge v7, v8, :cond_15

    .line 239
    :cond_13
    const/4 v7, 0x0

    .line 246
    :goto_14
    return-object v7

    .line 240
    :cond_15
    aget v2, v3, v10

    .line 241
    .local v2, "blackR":I
    aget v6, v3, v11

    .line 242
    .local v6, "whiteR":I
    aget v1, v3, v12

    .line 243
    .local v1, "blackG":I
    aget v5, v3, v13

    .line 244
    .local v5, "whiteG":I
    aget v0, v3, v14

    .line 245
    .local v0, "blackB":I
    const/4 v7, 0x5

    aget v4, v3, v7

    .line 246
    .local v4, "whiteB":I
    const-string v7, "[%d,%d,%d] [%d,%d,%d]"

    const/4 v8, 0x6

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v12

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v13

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v14

    const/4 v9, 0x5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_14
.end method

.method public getResolutionDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 297
    const/16 v0, 0x128

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "(No unit)"

    aput-object v3, v1, v2

    const-string v2, "Inch"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "cm"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRowsPerStripDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 384
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x116

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 385
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " rows/strip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getSamplesPerPixelDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 377
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x115

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 378
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " samples/pixel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getSaturationDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 531
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa409

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "None"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Low saturation"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "High saturation"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSceneCaptureTypeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 563
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa406

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Standard"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Landscape"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Portrait"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Night scene"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSceneTypeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 688
    const v0, 0xa301

    new-array v1, v4, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Directly photographed image"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSensingMethodDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 1066
    const v0, 0xa217

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "(Not defined)"

    aput-object v3, v1, v2

    const-string v2, "One-chip color area sensor"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Two-chip color area sensor"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Three-chip color area sensor"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Color sequential area sensor"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Trilinear sensor"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Color sequential linear sensor"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSensitivityTypeRangeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 500
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0x8830

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Unknown"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Standard Output Sensitivity"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Recommended Exposure Index"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "ISO Speed"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Standard Output Sensitivity and Recommended Exposure Index"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Standard Output Sensitivity and ISO Speed"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Recommended Exposure Index and ISO Speed"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Standard Output Sensitivity, Recommended Exposure Index and ISO Speed"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSharpnessDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 521
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa40a

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "None"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Low"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Hard"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShutterSpeedDescription()Ljava/lang/String;
    .registers 13
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    .line 1015
    iget-object v6, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v7, 0x9201

    invoke-virtual {v6, v7}, Lcom/drew/metadata/Directory;->getFloatObject(I)Ljava/lang/Float;

    move-result-object v3

    .line 1016
    .local v3, "apexValue":Ljava/lang/Float;
    if-nez v3, :cond_f

    .line 1017
    const/4 v6, 0x0

    .line 1027
    :goto_e
    return-object v6

    .line 1018
    :cond_f
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    cmpg-float v6, v6, v7

    if-gtz v6, :cond_5d

    .line 1019
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v8

    float-to-double v8, v8

    invoke-static {v10, v11}, Ljava/lang/Math;->log(D)D

    move-result-wide v10

    mul-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->exp(D)D

    move-result-wide v8

    div-double/2addr v6, v8

    double-to-float v0, v6

    .line 1020
    .local v0, "apexPower":F
    float-to-double v6, v0

    const-wide/high16 v8, 0x4024000000000000L    # 10.0

    mul-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v1

    .line 1021
    .local v1, "apexPower10":J
    long-to-float v6, v1

    const/high16 v7, 0x41200000    # 10.0f

    div-float v4, v6, v7

    .line 1022
    .local v4, "fApexPower":F
    new-instance v5, Ljava/text/DecimalFormat;

    const-string v6, "0.##"

    invoke-direct {v5, v6}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 1023
    .local v5, "format":Ljava/text/DecimalFormat;
    sget-object v6, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    invoke-virtual {v5, v6}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 1024
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    float-to-double v7, v4

    invoke-virtual {v5, v7, v8}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " sec"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_e

    .line 1026
    .end local v0    # "apexPower":F
    .end local v1    # "apexPower10":J
    .end local v4    # "fApexPower":F
    .end local v5    # "format":Ljava/text/DecimalFormat;
    :cond_5d
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    float-to-double v6, v6

    invoke-static {v10, v11}, Ljava/lang/Math;->log(D)D

    move-result-wide v8

    mul-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->exp(D)D

    move-result-wide v6

    double-to-int v0, v6

    .line 1027
    .local v0, "apexPower":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "1/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " sec"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_e
.end method

.method public getStripByteCountsDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 391
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x117

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 392
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getSubfileTypeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 460
    const/16 v0, 0xff

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Full-resolution image"

    aput-object v3, v1, v2

    const-string v2, "Reduced-resolution image"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Single page of multi-page image"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSubjectDistanceDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 976
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v2, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v3, 0x9206

    invoke-virtual {v2, v3}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v1

    .line 977
    .local v1, "value":Lcom/drew/lang/Rational;
    if-nez v1, :cond_d

    .line 978
    const/4 v2, 0x0

    .line 980
    :goto_c
    return-object v2

    .line 979
    :cond_d
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.0##"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 980
    .local v0, "formatter":Ljava/text/DecimalFormat;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " metres"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_c
.end method

.method public getSubjectDistanceRangeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 489
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa40c

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Unknown"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Macro"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Close view"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Distant view"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getThresholdingDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 470
    const/16 v0, 0x107

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No dithering or halftoning"

    aput-object v3, v1, v2

    const-string v2, "Ordered dither or halftone"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Randomized dither"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserCommentDescription()Ljava/lang/String;
    .registers 15
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v10, 0x0

    const/16 v13, 0xa

    .line 624
    iget-object v11, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v12, 0x9286

    invoke-virtual {v11, v12}, Lcom/drew/metadata/Directory;->getByteArray(I)[B

    move-result-object v2

    .line 625
    .local v2, "commentBytes":[B
    if-nez v2, :cond_f

    .line 657
    :goto_e
    return-object v10

    .line 627
    :cond_f
    array-length v11, v2

    if-nez v11, :cond_15

    .line 628
    const-string v10, ""

    goto :goto_e

    .line 630
    :cond_15
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 631
    .local v3, "encodingMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v11, "ASCII"

    const-string v12, "file.encoding"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v3, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 632
    const-string v11, "UNICODE"

    const-string v12, "UTF-16LE"

    invoke-interface {v3, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    const-string v11, "JIS"

    const-string v12, "Shift-JIS"

    invoke-interface {v3, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    :try_start_33
    array-length v11, v2

    if-lt v11, v13, :cond_91

    .line 637
    new-instance v6, Ljava/lang/String;

    const/4 v11, 0x0

    const/16 v12, 0xa

    invoke-direct {v6, v2, v11, v12}, Ljava/lang/String;-><init>([BII)V

    .line 640
    .local v6, "firstTenBytesString":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_46
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_91

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 641
    .local v9, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 642
    .local v4, "encodingName":Ljava/lang/String;
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 643
    .local v1, "charset":Ljava/lang/String;
    invoke-virtual {v6, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_46

    .line 645
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    .local v8, "j":I
    :goto_68
    if-ge v8, v13, :cond_81

    .line 646
    aget-byte v0, v2, v8

    .line 647
    .local v0, "b":B
    if-eqz v0, :cond_7e

    const/16 v11, 0x20

    if-eq v0, v11, :cond_7e

    .line 648
    new-instance v11, Ljava/lang/String;

    array-length v12, v2

    sub-int/2addr v12, v8

    invoke-direct {v11, v2, v8, v12, v1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    goto :goto_e

    .line 645
    :cond_7e
    add-int/lit8 v8, v8, 0x1

    goto :goto_68

    .line 650
    .end local v0    # "b":B
    :cond_81
    new-instance v11, Ljava/lang/String;

    const/16 v12, 0xa

    array-length v13, v2

    add-int/lit8 v13, v13, -0xa

    invoke-direct {v11, v2, v12, v13, v1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_e

    .line 655
    .end local v1    # "charset":Ljava/lang/String;
    .end local v4    # "encodingName":Ljava/lang/String;
    .end local v6    # "firstTenBytesString":Ljava/lang/String;
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "j":I
    .end local v9    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_91
    new-instance v11, Ljava/lang/String;

    const-string v12, "file.encoding"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v2, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_9f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_33 .. :try_end_9f} :catch_a2

    move-result-object v10

    goto/16 :goto_e

    .line 656
    :catch_a2
    move-exception v5

    .line 657
    .local v5, "ex":Ljava/io/UnsupportedEncodingException;
    goto/16 :goto_e
.end method

.method public getWhiteBalanceDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 867
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const v2, 0x9208

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 868
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 869
    const/4 v1, 0x0

    .line 894
    :goto_c
    return-object v1

    .line 870
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_70

    .line 894
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    .line 871
    :sswitch_2e
    const-string v1, "Unknown"

    goto :goto_c

    .line 872
    :sswitch_31
    const-string v1, "Daylight"

    goto :goto_c

    .line 873
    :sswitch_34
    const-string v1, "Florescent"

    goto :goto_c

    .line 874
    :sswitch_37
    const-string v1, "Tungsten"

    goto :goto_c

    .line 875
    :sswitch_3a
    const-string v1, "Flash"

    goto :goto_c

    .line 876
    :sswitch_3d
    const-string v1, "Fine Weather"

    goto :goto_c

    .line 877
    :sswitch_40
    const-string v1, "Cloudy"

    goto :goto_c

    .line 878
    :sswitch_43
    const-string v1, "Shade"

    goto :goto_c

    .line 879
    :sswitch_46
    const-string v1, "Daylight Fluorescent"

    goto :goto_c

    .line 880
    :sswitch_49
    const-string v1, "Day White Fluorescent"

    goto :goto_c

    .line 881
    :sswitch_4c
    const-string v1, "Cool White Fluorescent"

    goto :goto_c

    .line 882
    :sswitch_4f
    const-string v1, "White Fluorescent"

    goto :goto_c

    .line 883
    :sswitch_52
    const-string v1, "Warm White Fluorescent"

    goto :goto_c

    .line 884
    :sswitch_55
    const-string v1, "Standard light"

    goto :goto_c

    .line 885
    :sswitch_58
    const-string v1, "Standard light (B)"

    goto :goto_c

    .line 886
    :sswitch_5b
    const-string v1, "Standard light (C)"

    goto :goto_c

    .line 887
    :sswitch_5e
    const-string v1, "D55"

    goto :goto_c

    .line 888
    :sswitch_61
    const-string v1, "D65"

    goto :goto_c

    .line 889
    :sswitch_64
    const-string v1, "D75"

    goto :goto_c

    .line 890
    :sswitch_67
    const-string v1, "D50"

    goto :goto_c

    .line 891
    :sswitch_6a
    const-string v1, "Studio Tungsten"

    goto :goto_c

    .line 892
    :sswitch_6d
    const-string v1, "(Other)"

    goto :goto_c

    .line 870
    :sswitch_data_70
    .sparse-switch
        0x0 -> :sswitch_2e
        0x1 -> :sswitch_31
        0x2 -> :sswitch_34
        0x3 -> :sswitch_37
        0x4 -> :sswitch_3a
        0x9 -> :sswitch_3d
        0xa -> :sswitch_40
        0xb -> :sswitch_43
        0xc -> :sswitch_46
        0xd -> :sswitch_49
        0xe -> :sswitch_4c
        0xf -> :sswitch_4f
        0x10 -> :sswitch_52
        0x11 -> :sswitch_55
        0x12 -> :sswitch_58
        0x13 -> :sswitch_5b
        0x14 -> :sswitch_5e
        0x15 -> :sswitch_61
        0x16 -> :sswitch_64
        0x17 -> :sswitch_67
        0x18 -> :sswitch_6a
        0xff -> :sswitch_6d
    .end sparse-switch
.end method

.method public getWhiteBalanceModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 596
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0xa403

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto white balance"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Manual white balance"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWindowsAuthorDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 318
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0x9c9d

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getUnicodeDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWindowsCommentDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 324
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0x9c9c

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getUnicodeDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWindowsKeywordsDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 330
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0x9c9e

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getUnicodeDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWindowsSubjectDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 342
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0x9c9f

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getUnicodeDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWindowsTitleDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 336
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const v0, 0x9c9b

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getUnicodeDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getXResolutionDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v6, 0x1

    .line 264
    iget-object v2, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v3, 0x11a

    invoke-virtual {v2, v3}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v1

    .line 265
    .local v1, "value":Lcom/drew/lang/Rational;
    if-nez v1, :cond_d

    .line 266
    const/4 v2, 0x0

    .line 268
    :goto_c
    return-object v2

    .line 267
    :cond_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getResolutionDescription()Ljava/lang/String;

    move-result-object v0

    .line 268
    .local v0, "unit":Ljava/lang/String;
    const-string v3, "%s dots per %s"

    const/4 v2, 0x2

    new-array v4, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v1, v6}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    if-nez v0, :cond_28

    const-string v2, "unit"

    :goto_21
    aput-object v2, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_c

    :cond_28
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    goto :goto_21
.end method

.method public getYCbCrPositioningDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v4, 0x1

    .line 276
    const/16 v0, 0x213

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Center of pixel array"

    aput-object v3, v1, v2

    const-string v2, "Datum point"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYCbCrSubsamplingDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x2

    .line 348
    iget-object v1, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v2, 0x212

    invoke-virtual {v1, v2}, Lcom/drew/metadata/Directory;->getIntArray(I)[I

    move-result-object v0

    .line 349
    .local v0, "positions":[I
    if-eqz v0, :cond_10

    array-length v1, v0

    if-ge v1, v3, :cond_12

    .line 350
    :cond_10
    const/4 v1, 0x0

    .line 356
    :goto_11
    return-object v1

    .line 351
    :cond_12
    aget v1, v0, v5

    if-ne v1, v3, :cond_1d

    aget v1, v0, v4

    if-ne v1, v4, :cond_1d

    .line 352
    const-string v1, "YCbCr4:2:2"

    goto :goto_11

    .line 353
    :cond_1d
    aget v1, v0, v5

    if-ne v1, v3, :cond_28

    aget v1, v0, v4

    if-ne v1, v3, :cond_28

    .line 354
    const-string v1, "YCbCr4:2:0"

    goto :goto_11

    .line 356
    :cond_28
    const-string v1, "(Unknown)"

    goto :goto_11
.end method

.method public getYResolutionDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/exif/ExifDescriptorBase;, "Lcom/drew/metadata/exif/ExifDescriptorBase<TT;>;"
    const/4 v6, 0x1

    .line 252
    iget-object v2, p0, Lcom/drew/metadata/exif/ExifDescriptorBase;->_directory:Lcom/drew/metadata/Directory;

    const/16 v3, 0x11b

    invoke-virtual {v2, v3}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v1

    .line 253
    .local v1, "value":Lcom/drew/lang/Rational;
    if-nez v1, :cond_d

    .line 254
    const/4 v2, 0x0

    .line 256
    :goto_c
    return-object v2

    .line 255
    :cond_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/ExifDescriptorBase;->getResolutionDescription()Ljava/lang/String;

    move-result-object v0

    .line 256
    .local v0, "unit":Ljava/lang/String;
    const-string v3, "%s dots per %s"

    const/4 v2, 0x2

    new-array v4, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v1, v6}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    if-nez v0, :cond_28

    const-string v2, "unit"

    :goto_21
    aput-object v2, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_c

    :cond_28
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    goto :goto_21
.end method
