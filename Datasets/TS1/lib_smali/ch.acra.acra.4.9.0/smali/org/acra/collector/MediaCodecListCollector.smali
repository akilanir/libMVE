.class final Lorg/acra/collector/MediaCodecListCollector;
.super Ljava/lang/Object;
.source "MediaCodecListCollector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/collector/MediaCodecListCollector$CodecType;
    }
.end annotation


# static fields
.field private static final AAC_TYPES:[Ljava/lang/String;

.field private static final AVC_TYPES:[Ljava/lang/String;

.field private static final COLOR_FORMAT_PREFIX:Ljava/lang/String; = "COLOR_"

.field private static final H263_TYPES:[Ljava/lang/String;

.field private static final MPEG4_TYPES:[Ljava/lang/String;

.field private static final mAACProfileValues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final mAVCLevelValues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final mAVCProfileValues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final mColorFormatValues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final mH263LevelValues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final mH263ProfileValues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final mMPEG4LevelValues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final mMPEG4ProfileValues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v3, 0x0

    .line 45
    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "mp4"

    aput-object v5, v4, v3

    const-string v5, "mpeg4"

    aput-object v5, v4, v6

    const-string v5, "MP4"

    aput-object v5, v4, v7

    const-string v5, "MPEG4"

    aput-object v5, v4, v8

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->MPEG4_TYPES:[Ljava/lang/String;

    .line 46
    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "avc"

    aput-object v5, v4, v3

    const-string v5, "h264"

    aput-object v5, v4, v6

    const-string v5, "AVC"

    aput-object v5, v4, v7

    const-string v5, "H264"

    aput-object v5, v4, v8

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->AVC_TYPES:[Ljava/lang/String;

    .line 47
    new-array v4, v7, [Ljava/lang/String;

    const-string v5, "h263"

    aput-object v5, v4, v3

    const-string v5, "H263"

    aput-object v5, v4, v6

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->H263_TYPES:[Ljava/lang/String;

    .line 48
    new-array v4, v7, [Ljava/lang/String;

    const-string v5, "aac"

    aput-object v5, v4, v3

    const-string v5, "AAC"

    aput-object v5, v4, v6

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->AAC_TYPES:[Ljava/lang/String;

    .line 50
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->mColorFormatValues:Landroid/util/SparseArray;

    .line 51
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->mAVCLevelValues:Landroid/util/SparseArray;

    .line 52
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->mAVCProfileValues:Landroid/util/SparseArray;

    .line 53
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->mH263LevelValues:Landroid/util/SparseArray;

    .line 54
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->mH263ProfileValues:Landroid/util/SparseArray;

    .line 55
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->mMPEG4LevelValues:Landroid/util/SparseArray;

    .line 56
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->mMPEG4ProfileValues:Landroid/util/SparseArray;

    .line 57
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    sput-object v4, Lorg/acra/collector/MediaCodecListCollector;->mAACProfileValues:Landroid/util/SparseArray;

    .line 62
    :try_start_7e
    const-string v4, "android.media.MediaCodecInfo$CodecCapabilities"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 65
    .local v0, "codecCapabilitiesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v5

    array-length v6, v5

    move v4, v3

    :goto_8a
    if-ge v4, v6, :cond_bf

    aget-object v2, v5, v4

    .line 66
    .local v2, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-eqz v7, :cond_bc

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v7

    if-eqz v7, :cond_bc

    .line 67
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "COLOR_"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_bc

    .line 68
    sget-object v7, Lorg/acra/collector/MediaCodecListCollector;->mColorFormatValues:Landroid/util/SparseArray;

    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v8

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 65
    :cond_bc
    add-int/lit8 v4, v4, 0x1

    goto :goto_8a

    .line 73
    .end local v2    # "f":Ljava/lang/reflect/Field;
    :cond_bf
    const-string v4, "android.media.MediaCodecInfo$CodecProfileLevel"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 74
    .local v1, "codecProfileLevelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    array-length v5, v4

    :goto_ca
    if-ge v3, v5, :cond_11b

    aget-object v2, v4, v3

    .line 75
    .restart local v2    # "f":Ljava/lang/reflect/Field;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6

    if-eqz v6, :cond_fc

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v6

    if-eqz v6, :cond_fc

    .line 76
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "AVCLevel"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_ff

    .line 77
    sget-object v6, Lorg/acra/collector/MediaCodecListCollector;->mAVCLevelValues:Landroid/util/SparseArray;

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 74
    :cond_fc
    :goto_fc
    add-int/lit8 v3, v3, 0x1

    goto :goto_ca

    .line 78
    :cond_ff
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "AVCProfile"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_11c

    .line 79
    sget-object v6, Lorg/acra/collector/MediaCodecListCollector;->mAVCProfileValues:Landroid/util/SparseArray;

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_fc

    .line 93
    .end local v1    # "codecProfileLevelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "f":Ljava/lang/reflect/Field;
    :catch_11a
    move-exception v3

    .line 103
    :cond_11b
    :goto_11b
    return-void

    .line 80
    .restart local v1    # "codecProfileLevelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "f":Ljava/lang/reflect/Field;
    :cond_11c
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "H263Level"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_139

    .line 81
    sget-object v6, Lorg/acra/collector/MediaCodecListCollector;->mH263LevelValues:Landroid/util/SparseArray;

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_fc

    .line 95
    .end local v1    # "codecProfileLevelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "f":Ljava/lang/reflect/Field;
    :catch_137
    move-exception v3

    goto :goto_11b

    .line 82
    .restart local v1    # "codecProfileLevelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "f":Ljava/lang/reflect/Field;
    :cond_139
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "H263Profile"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_156

    .line 83
    sget-object v6, Lorg/acra/collector/MediaCodecListCollector;->mH263ProfileValues:Landroid/util/SparseArray;

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_fc

    .line 97
    .end local v1    # "codecProfileLevelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "f":Ljava/lang/reflect/Field;
    :catch_154
    move-exception v3

    goto :goto_11b

    .line 84
    .restart local v1    # "codecProfileLevelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "f":Ljava/lang/reflect/Field;
    :cond_156
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "MPEG4Level"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_173

    .line 85
    sget-object v6, Lorg/acra/collector/MediaCodecListCollector;->mMPEG4LevelValues:Landroid/util/SparseArray;

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_fc

    .line 99
    .end local v1    # "codecProfileLevelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "f":Ljava/lang/reflect/Field;
    :catch_171
    move-exception v3

    goto :goto_11b

    .line 86
    .restart local v1    # "codecProfileLevelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "f":Ljava/lang/reflect/Field;
    :cond_173
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "MPEG4Profile"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_18f

    .line 87
    sget-object v6, Lorg/acra/collector/MediaCodecListCollector;->mMPEG4ProfileValues:Landroid/util/SparseArray;

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_fc

    .line 88
    :cond_18f
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "AAC"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_fc

    .line 89
    sget-object v6, Lorg/acra/collector/MediaCodecListCollector;->mAACProfileValues:Landroid/util/SparseArray;

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_1a9
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7e .. :try_end_1a9} :catch_11a
    .catch Ljava/lang/SecurityException; {:try_start_7e .. :try_end_1a9} :catch_137
    .catch Ljava/lang/IllegalAccessException; {:try_start_7e .. :try_end_1a9} :catch_154
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7e .. :try_end_1a9} :catch_171

    goto/16 :goto_fc
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static collectCapabilitiesForType(Landroid/media/MediaCodecInfo;Ljava/lang/String;)Ljava/lang/String;
    .registers 15
    .param p0, "codecInfo"    # Landroid/media/MediaCodecInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/16 v12, 0x2c

    const/16 v11, 0xa

    const/16 v10, 0x2d

    .line 161
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .local v7, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v0

    .line 165
    .local v0, "codecCapabilities":Landroid/media/MediaCodecInfo$CodecCapabilities;
    iget-object v3, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 166
    .local v3, "colorFormats":[I
    array-length v8, v3

    if-lez v8, :cond_3c

    .line 167
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " color formats:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1e
    array-length v8, v3

    if-ge v4, v8, :cond_39

    .line 169
    sget-object v8, Lorg/acra/collector/MediaCodecListCollector;->mColorFormatValues:Landroid/util/SparseArray;

    aget v9, v3, v4

    invoke-virtual {v8, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    array-length v8, v3

    add-int/lit8 v8, v8, -0x1

    if-ge v4, v8, :cond_36

    .line 171
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 168
    :cond_36
    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    .line 174
    :cond_39
    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 177
    .end local v4    # "i":I
    :cond_3c
    invoke-static {p0}, Lorg/acra/collector/MediaCodecListCollector;->identifyCodecType(Landroid/media/MediaCodecInfo;)Lorg/acra/collector/MediaCodecListCollector$CodecType;

    move-result-object v2

    .line 180
    .local v2, "codecType":Lorg/acra/collector/MediaCodecListCollector$CodecType;
    iget-object v1, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 181
    .local v1, "codecProfileLevels":[Landroid/media/MediaCodecInfo$CodecProfileLevel;
    array-length v8, v1

    if-lez v8, :cond_6a

    .line 182
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " profile levels:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_4f
    array-length v8, v1

    if-ge v4, v8, :cond_67

    .line 185
    aget-object v8, v1, v4

    iget v6, v8, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 186
    .local v6, "profileValue":I
    aget-object v8, v1, v4

    iget v5, v8, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    .line 188
    .local v5, "levelValue":I
    if-nez v2, :cond_73

    .line 190
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    .end local v5    # "levelValue":I
    .end local v6    # "profileValue":I
    :cond_67
    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 221
    .end local v4    # "i":I
    :cond_6a
    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8

    .line 194
    .restart local v4    # "i":I
    .restart local v5    # "levelValue":I
    .restart local v6    # "profileValue":I
    :cond_73
    sget-object v8, Lorg/acra/collector/MediaCodecListCollector$1;->$SwitchMap$org$acra$collector$MediaCodecListCollector$CodecType:[I

    invoke-virtual {v2}, Lorg/acra/collector/MediaCodecListCollector$CodecType;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_ee

    .line 214
    :goto_7e
    array-length v8, v1

    add-int/lit8 v8, v8, -0x1

    if-ge v4, v8, :cond_86

    .line 215
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 183
    :cond_86
    add-int/lit8 v4, v4, 0x1

    goto :goto_4f

    .line 196
    :pswitch_89
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/acra/collector/MediaCodecListCollector;->mAVCProfileValues:Landroid/util/SparseArray;

    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/acra/collector/MediaCodecListCollector;->mAVCLevelValues:Landroid/util/SparseArray;

    .line 197
    invoke-virtual {v8, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7e

    .line 200
    :pswitch_a9
    sget-object v8, Lorg/acra/collector/MediaCodecListCollector;->mH263ProfileValues:Landroid/util/SparseArray;

    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/acra/collector/MediaCodecListCollector;->mH263LevelValues:Landroid/util/SparseArray;

    .line 201
    invoke-virtual {v8, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7e

    .line 204
    :pswitch_c5
    sget-object v8, Lorg/acra/collector/MediaCodecListCollector;->mMPEG4ProfileValues:Landroid/util/SparseArray;

    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/acra/collector/MediaCodecListCollector;->mMPEG4LevelValues:Landroid/util/SparseArray;

    .line 205
    invoke-virtual {v8, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7e

    .line 208
    :pswitch_e1
    sget-object v8, Lorg/acra/collector/MediaCodecListCollector;->mAACProfileValues:Landroid/util/SparseArray;

    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7e

    .line 194
    nop

    :pswitch_data_ee
    .packed-switch 0x1
        :pswitch_89
        :pswitch_a9
        :pswitch_c5
        :pswitch_e1
    .end packed-switch
.end method

.method public static collectMediaCodecList()Ljava/lang/String;
    .registers 12
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/16 v11, 0xa

    .line 114
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x10

    if-ge v8, v9, :cond_b

    .line 115
    const-string v8, ""

    .line 145
    .local v3, "i":I
    .local v4, "infos":[Landroid/media/MediaCodecInfo;
    .local v5, "result":Ljava/lang/StringBuilder;
    :goto_a
    return-object v8

    .line 119
    .end local v3    # "i":I
    .end local v4    # "infos":[Landroid/media/MediaCodecInfo;
    .end local v5    # "result":Ljava/lang/StringBuilder;
    :cond_b
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x15

    if-ge v8, v9, :cond_23

    .line 121
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v0

    .line 122
    .local v0, "codecCount":I
    new-array v4, v0, [Landroid/media/MediaCodecInfo;

    .line 123
    .restart local v4    # "infos":[Landroid/media/MediaCodecInfo;
    const/4 v1, 0x0

    .local v1, "codecIdx":I
    :goto_18
    if-ge v1, v0, :cond_2d

    .line 125
    invoke-static {v1}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v8

    aput-object v8, v4, v1

    .line 123
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 128
    .end local v0    # "codecCount":I
    .end local v1    # "codecIdx":I
    .end local v4    # "infos":[Landroid/media/MediaCodecInfo;
    :cond_23
    new-instance v8, Landroid/media/MediaCodecList;

    const/4 v9, 0x1

    invoke-direct {v8, v9}, Landroid/media/MediaCodecList;-><init>(I)V

    invoke-virtual {v8}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    move-result-object v4

    .line 131
    .restart local v4    # "infos":[Landroid/media/MediaCodecInfo;
    :cond_2d
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .restart local v5    # "result":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_33
    array-length v8, v4

    if-ge v3, v8, :cond_8e

    .line 133
    aget-object v2, v4, v3

    .line 134
    .local v2, "codecInfo":Landroid/media/MediaCodecInfo;
    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 135
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "isEncoder: "

    .line 136
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 138
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v6

    .line 139
    .local v6, "supportedTypes":[Ljava/lang/String;
    const-string v8, "Supported types: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v6}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 140
    array-length v9, v6

    const/4 v8, 0x0

    :goto_7a
    if-ge v8, v9, :cond_88

    aget-object v7, v6, v8

    .line 141
    .local v7, "type":Ljava/lang/String;
    invoke-static {v2, v7}, Lorg/acra/collector/MediaCodecListCollector;->collectCapabilitiesForType(Landroid/media/MediaCodecInfo;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    add-int/lit8 v8, v8, 0x1

    goto :goto_7a

    .line 143
    .end local v7    # "type":Ljava/lang/String;
    :cond_88
    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    add-int/lit8 v3, v3, 0x1

    goto :goto_33

    .line 145
    .end local v2    # "codecInfo":Landroid/media/MediaCodecInfo;
    .end local v6    # "supportedTypes":[Ljava/lang/String;
    :cond_8e
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_a
.end method

.method private static identifyCodecType(Landroid/media/MediaCodecInfo;)Lorg/acra/collector/MediaCodecListCollector$CodecType;
    .registers 8
    .param p0, "codecInfo"    # Landroid/media/MediaCodecInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 234
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v0

    .line 235
    .local v0, "name":Ljava/lang/String;
    sget-object v4, Lorg/acra/collector/MediaCodecListCollector;->AVC_TYPES:[Ljava/lang/String;

    array-length v5, v4

    move v3, v2

    :goto_9
    if-ge v3, v5, :cond_19

    aget-object v1, v4, v3

    .line 236
    .local v1, "token":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 237
    sget-object v2, Lorg/acra/collector/MediaCodecListCollector$CodecType;->AVC:Lorg/acra/collector/MediaCodecListCollector$CodecType;

    .line 256
    .end local v1    # "token":Ljava/lang/String;
    :goto_15
    return-object v2

    .line 235
    .restart local v1    # "token":Ljava/lang/String;
    :cond_16
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 240
    .end local v1    # "token":Ljava/lang/String;
    :cond_19
    sget-object v4, Lorg/acra/collector/MediaCodecListCollector;->H263_TYPES:[Ljava/lang/String;

    array-length v5, v4

    move v3, v2

    :goto_1d
    if-ge v3, v5, :cond_2d

    aget-object v1, v4, v3

    .line 241
    .restart local v1    # "token":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2a

    .line 242
    sget-object v2, Lorg/acra/collector/MediaCodecListCollector$CodecType;->H263:Lorg/acra/collector/MediaCodecListCollector$CodecType;

    goto :goto_15

    .line 240
    :cond_2a
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 245
    .end local v1    # "token":Ljava/lang/String;
    :cond_2d
    sget-object v4, Lorg/acra/collector/MediaCodecListCollector;->MPEG4_TYPES:[Ljava/lang/String;

    array-length v5, v4

    move v3, v2

    :goto_31
    if-ge v3, v5, :cond_41

    aget-object v1, v4, v3

    .line 246
    .restart local v1    # "token":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3e

    .line 247
    sget-object v2, Lorg/acra/collector/MediaCodecListCollector$CodecType;->MPEG4:Lorg/acra/collector/MediaCodecListCollector$CodecType;

    goto :goto_15

    .line 245
    :cond_3e
    add-int/lit8 v3, v3, 0x1

    goto :goto_31

    .line 250
    .end local v1    # "token":Ljava/lang/String;
    :cond_41
    sget-object v3, Lorg/acra/collector/MediaCodecListCollector;->AAC_TYPES:[Ljava/lang/String;

    array-length v4, v3

    :goto_44
    if-ge v2, v4, :cond_54

    aget-object v1, v3, v2

    .line 251
    .restart local v1    # "token":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_51

    .line 252
    sget-object v2, Lorg/acra/collector/MediaCodecListCollector$CodecType;->AAC:Lorg/acra/collector/MediaCodecListCollector$CodecType;

    goto :goto_15

    .line 250
    :cond_51
    add-int/lit8 v2, v2, 0x1

    goto :goto_44

    .line 256
    .end local v1    # "token":Ljava/lang/String;
    :cond_54
    const/4 v2, 0x0

    goto :goto_15
.end method
