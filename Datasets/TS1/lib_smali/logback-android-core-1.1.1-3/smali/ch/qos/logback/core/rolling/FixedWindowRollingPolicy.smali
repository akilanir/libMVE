.class public Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;
.super Lch/qos/logback/core/rolling/RollingPolicyBase;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/rolling/FixedWindowRollingPolicy$1;
    }
.end annotation


# static fields
.field static final FNP_NOT_SET:Ljava/lang/String; = "The \"FileNamePattern\" property must be set before using FixedWindowRollingPolicy. "

.field private static MAX_WINDOW_SIZE:I = 0x0

.field static final PRUDENT_MODE_UNSUPPORTED:Ljava/lang/String; = "See also http://logback.qos.ch/codes.html#tbr_fnp_prudent_unsupported"

.field static final SEE_PARENT_FN_NOT_SET:Ljava/lang/String; = "Please refer to http://logback.qos.ch/codes.html#fwrp_parentFileName_not_set"

.field public static final ZIP_ENTRY_DATE_PATTERN:Ljava/lang/String; = "yyyy-MM-dd_HHmm"


# instance fields
.field compressor:Lch/qos/logback/core/rolling/helper/Compressor;

.field maxIndex:I

.field minIndex:I

.field util:Lch/qos/logback/core/rolling/helper/RenameUtil;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x14

    sput v0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->MAX_WINDOW_SIZE:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/rolling/RollingPolicyBase;-><init>()V

    new-instance v0, Lch/qos/logback/core/rolling/helper/RenameUtil;

    invoke-direct {v0}, Lch/qos/logback/core/rolling/helper/RenameUtil;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->util:Lch/qos/logback/core/rolling/helper/RenameUtil;

    const/4 v0, 0x1

    iput v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    const/4 v0, 0x7

    iput v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    return-void
.end method

.method private transformFileNamePatternFromInt2Date(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-static {p1}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->slashify(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->afterLastSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "%i"

    const-string v2, "%d{yyyy-MM-dd_HHmm}"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getActiveFileName()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->getParentsRawFileProperty()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMaxIndex()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    return v0
.end method

.method protected getMaxWindowSize()I
    .registers 2

    sget v0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->MAX_WINDOW_SIZE:I

    return v0
.end method

.method public getMinIndex()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    return v0
.end method

.method public rollover()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/rolling/RolloverFailure;
        }
    .end annotation

    iget v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    if-ltz v0, :cond_67

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget v2, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    invoke-virtual {v1, v2}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertInt(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_1a
    iget v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    add-int/lit8 v0, v0, -0x1

    :goto_1e
    iget v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    if-lt v0, v1, :cond_5a

    iget-object v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    invoke-virtual {v1, v0}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertInt(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_43

    iget-object v2, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->util:Lch/qos/logback/core/rolling/helper/RenameUtil;

    iget-object v3, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertInt(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lch/qos/logback/core/rolling/helper/RenameUtil;->rename(Ljava/lang/String;Ljava/lang/String;)V

    :goto_40
    add-int/lit8 v0, v0, -0x1

    goto :goto_1e

    :cond_43
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Skipping roll-over for inexistent file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addInfo(Ljava/lang/String;)V

    goto :goto_40

    :cond_5a
    sget-object v0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy$1;->$SwitchMap$ch$qos$logback$core$rolling$helper$CompressionMode:[I

    iget-object v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    invoke-virtual {v1}, Lch/qos/logback/core/rolling/helper/CompressionMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_aa

    :cond_67
    :goto_67
    return-void

    :pswitch_68
    iget-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->util:Lch/qos/logback/core/rolling/helper/RenameUtil;

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->getActiveFileName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget v3, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    invoke-virtual {v2, v3}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertInt(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/RenameUtil;->rename(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_67

    :pswitch_7a
    iget-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->compressor:Lch/qos/logback/core/rolling/helper/Compressor;

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->getActiveFileName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget v3, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    invoke-virtual {v2, v3}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertInt(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lch/qos/logback/core/rolling/helper/Compressor;->compress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_67

    :pswitch_8d
    iget-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->compressor:Lch/qos/logback/core/rolling/helper/Compressor;

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->getActiveFileName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget v3, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    invoke-virtual {v2, v3}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertInt(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->zipEntryFileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3, v4}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lch/qos/logback/core/rolling/helper/Compressor;->compress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_67

    :pswitch_data_aa
    .packed-switch 0x1
        :pswitch_68
        :pswitch_7a
        :pswitch_8d
    .end packed-switch
.end method

.method public setMaxIndex(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    return-void
.end method

.method public setMinIndex(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    return-void
.end method

.method public start()V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->util:Lch/qos/logback/core/rolling/helper/RenameUtil;

    iget-object v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/rolling/helper/RenameUtil;->setContext(Lch/qos/logback/core/Context;)V

    iget-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePatternStr:Ljava/lang/String;

    if-eqz v0, :cond_31

    new-instance v0, Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget-object v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePatternStr:Ljava/lang/String;

    iget-object v2, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/FileNamePattern;-><init>(Ljava/lang/String;Lch/qos/logback/core/Context;)V

    iput-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->determineCompressionMode()V

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->isParentPrudent()Z

    move-result v0

    if-eqz v0, :cond_43

    const-string v0, "Prudent mode is not supported with FixedWindowRollingPolicy."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addError(Ljava/lang/String;)V

    const-string v0, "See also http://logback.qos.ch/codes.html#tbr_fnp_prudent_unsupported"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addError(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Prudent mode is not supported."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_31
    const-string v0, "The \"FileNamePattern\" property must be set before using FixedWindowRollingPolicy. "

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addError(Ljava/lang/String;)V

    const-string v0, "See also http://logback.qos.ch/codes.html#tbr_fnp_not_set"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addError(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The \"FileNamePattern\" property must be set before using FixedWindowRollingPolicy. See also http://logback.qos.ch/codes.html#tbr_fnp_not_set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_43
    invoke-virtual {p0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->getParentsRawFileProperty()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_5b

    const-string v0, "The File name property must be set before using this rolling policy."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addError(Ljava/lang/String;)V

    const-string v0, "Please refer to http://logback.qos.ch/codes.html#fwrp_parentFileName_not_set"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addError(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The \"File\" option must be set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5b
    iget v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    iget v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    if-ge v0, v1, :cond_94

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MaxIndex ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") cannot be smaller than MinIndex ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addWarn(Ljava/lang/String;)V

    const-string v0, "Setting maxIndex to equal minIndex."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addWarn(Ljava/lang/String;)V

    iget v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    iput v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    :cond_94
    invoke-virtual {p0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->getMaxWindowSize()I

    move-result v0

    iget v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    iget v2, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    sub-int/2addr v1, v2

    if-le v1, v0, :cond_c1

    const-string v1, "Large window sizes are not allowed."

    invoke-virtual {p0, v1}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addWarn(Ljava/lang/String;)V

    iget v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->minIndex:I

    add-int/2addr v0, v1

    iput v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MaxIndex reduced to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->maxIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->addWarn(Ljava/lang/String;)V

    :cond_c1
    iget-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    invoke-virtual {v0}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->getIntegerTokenConverter()Lch/qos/logback/core/rolling/helper/IntegerTokenConverter;

    move-result-object v0

    if-nez v0, :cond_ee

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FileNamePattern ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    invoke-virtual {v2}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->getPattern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] does not contain a valid IntegerToken"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_ee
    iget-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    sget-object v1, Lch/qos/logback/core/rolling/helper/CompressionMode;->ZIP:Lch/qos/logback/core/rolling/helper/CompressionMode;

    if-ne v0, v1, :cond_103

    iget-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->fileNamePatternStr:Ljava/lang/String;

    invoke-direct {p0, v0}, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->transformFileNamePatternFromInt2Date(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget-object v2, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-direct {v1, v0, v2}, Lch/qos/logback/core/rolling/helper/FileNamePattern;-><init>(Ljava/lang/String;Lch/qos/logback/core/Context;)V

    iput-object v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->zipEntryFileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    :cond_103
    new-instance v0, Lch/qos/logback/core/rolling/helper/Compressor;

    iget-object v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    invoke-direct {v0, v1}, Lch/qos/logback/core/rolling/helper/Compressor;-><init>(Lch/qos/logback/core/rolling/helper/CompressionMode;)V

    iput-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->compressor:Lch/qos/logback/core/rolling/helper/Compressor;

    iget-object v0, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->compressor:Lch/qos/logback/core/rolling/helper/Compressor;

    iget-object v1, p0, Lch/qos/logback/core/rolling/FixedWindowRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/rolling/helper/Compressor;->setContext(Lch/qos/logback/core/Context;)V

    invoke-super {p0}, Lch/qos/logback/core/rolling/RollingPolicyBase;->start()V

    return-void
.end method
