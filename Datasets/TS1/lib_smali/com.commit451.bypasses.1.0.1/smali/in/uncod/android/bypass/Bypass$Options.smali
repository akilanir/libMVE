.class public final Lin/uncod/android/bypass/Bypass$Options;
.super Ljava/lang/Object;
.source "Bypass.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lin/uncod/android/bypass/Bypass;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Options"
.end annotation


# instance fields
.field private mBlockQuoteColor:I

.field private mBlockQuoteIndentSize:F

.field private mBlockQuoteIndentUnit:I

.field private mCodeBlockIndentSize:F

.field private mCodeBlockIndentUnit:I

.field private mHeaderSizes:[F

.field private mHruleColor:I

.field private mHruleSize:F

.field private mHruleUnit:I

.field private mListItemIndentSize:F

.field private mListItemIndentUnit:I

.field private mUnorderedListItem:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/high16 v2, 0x41200000    # 10.0f

    const/4 v1, 0x1

    .line 321
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 322
    const/4 v0, 0x6

    new-array v0, v0, [F

    fill-array-data v0, :array_30

    iput-object v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mHeaderSizes:[F

    .line 331
    const-string v0, "\u2022"

    iput-object v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mUnorderedListItem:Ljava/lang/String;

    .line 332
    iput v1, p0, Lin/uncod/android/bypass/Bypass$Options;->mListItemIndentUnit:I

    .line 333
    iput v2, p0, Lin/uncod/android/bypass/Bypass$Options;->mListItemIndentSize:F

    .line 335
    const v0, -0xffff01

    iput v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteColor:I

    .line 336
    iput v1, p0, Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteIndentUnit:I

    .line 337
    iput v2, p0, Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteIndentSize:F

    .line 339
    iput v1, p0, Lin/uncod/android/bypass/Bypass$Options;->mCodeBlockIndentUnit:I

    .line 340
    iput v2, p0, Lin/uncod/android/bypass/Bypass$Options;->mCodeBlockIndentSize:F

    .line 342
    const v0, -0x777778

    iput v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mHruleColor:I

    .line 343
    iput v1, p0, Lin/uncod/android/bypass/Bypass$Options;->mHruleUnit:I

    .line 344
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mHruleSize:F

    .line 345
    return-void

    .line 322
    nop

    :array_30
    .array-data 4
        0x3fc00000    # 1.5f
        0x3fb33333    # 1.4f
        0x3fa66666    # 1.3f
        0x3f99999a    # 1.2f
        0x3f8ccccd    # 1.1f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static synthetic access$000(Lin/uncod/android/bypass/Bypass$Options;)I
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mListItemIndentUnit:I

    return v0
.end method

.method static synthetic access$100(Lin/uncod/android/bypass/Bypass$Options;)F
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mListItemIndentSize:F

    return v0
.end method

.method static synthetic access$1000(Lin/uncod/android/bypass/Bypass$Options;)I
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteColor:I

    return v0
.end method

.method static synthetic access$1100(Lin/uncod/android/bypass/Bypass$Options;)I
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mHruleColor:I

    return v0
.end method

.method static synthetic access$200(Lin/uncod/android/bypass/Bypass$Options;)I
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteIndentUnit:I

    return v0
.end method

.method static synthetic access$300(Lin/uncod/android/bypass/Bypass$Options;)F
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteIndentSize:F

    return v0
.end method

.method static synthetic access$400(Lin/uncod/android/bypass/Bypass$Options;)I
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mCodeBlockIndentUnit:I

    return v0
.end method

.method static synthetic access$500(Lin/uncod/android/bypass/Bypass$Options;)F
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mCodeBlockIndentSize:F

    return v0
.end method

.method static synthetic access$600(Lin/uncod/android/bypass/Bypass$Options;)I
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mHruleUnit:I

    return v0
.end method

.method static synthetic access$700(Lin/uncod/android/bypass/Bypass$Options;)F
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mHruleSize:F

    return v0
.end method

.method static synthetic access$800(Lin/uncod/android/bypass/Bypass$Options;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget-object v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mUnorderedListItem:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lin/uncod/android/bypass/Bypass$Options;)[F
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 303
    iget-object v0, p0, Lin/uncod/android/bypass/Bypass$Options;->mHeaderSizes:[F

    return-object v0
.end method


# virtual methods
.method public setBlockQuoteColor(I)Lin/uncod/android/bypass/Bypass$Options;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 372
    iput p1, p0, Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteColor:I

    .line 373
    return-object p0
.end method

.method public setBlockQuoteIndentSize(IF)Lin/uncod/android/bypass/Bypass$Options;
    .registers 3
    .param p1, "unit"    # I
    .param p2, "size"    # F

    .prologue
    .line 377
    iput p1, p0, Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteIndentUnit:I

    .line 378
    iput p2, p0, Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteIndentSize:F

    .line 379
    return-object p0
.end method

.method public setCodeBlockIndentSize(IF)Lin/uncod/android/bypass/Bypass$Options;
    .registers 3
    .param p1, "unit"    # I
    .param p2, "size"    # F

    .prologue
    .line 383
    iput p1, p0, Lin/uncod/android/bypass/Bypass$Options;->mCodeBlockIndentUnit:I

    .line 384
    iput p2, p0, Lin/uncod/android/bypass/Bypass$Options;->mCodeBlockIndentSize:F

    .line 385
    return-object p0
.end method

.method public setHeaderSizes([F)Lin/uncod/android/bypass/Bypass$Options;
    .registers 4
    .param p1, "headerSizes"    # [F

    .prologue
    .line 348
    if-nez p1, :cond_a

    .line 349
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "headerSizes must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 351
    :cond_a
    array-length v0, p1

    const/4 v1, 0x6

    if-eq v0, v1, :cond_16

    .line 352
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "headerSizes must have 6 elements (h1 through h6)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 355
    :cond_16
    iput-object p1, p0, Lin/uncod/android/bypass/Bypass$Options;->mHeaderSizes:[F

    .line 357
    return-object p0
.end method

.method public setHruleColor(I)Lin/uncod/android/bypass/Bypass$Options;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 389
    iput p1, p0, Lin/uncod/android/bypass/Bypass$Options;->mHruleColor:I

    .line 390
    return-object p0
.end method

.method public setHruleSize(IF)Lin/uncod/android/bypass/Bypass$Options;
    .registers 3
    .param p1, "unit"    # I
    .param p2, "size"    # F

    .prologue
    .line 394
    iput p1, p0, Lin/uncod/android/bypass/Bypass$Options;->mHruleUnit:I

    .line 395
    iput p2, p0, Lin/uncod/android/bypass/Bypass$Options;->mHruleSize:F

    .line 396
    return-object p0
.end method

.method public setListItemIndentSize(IF)Lin/uncod/android/bypass/Bypass$Options;
    .registers 3
    .param p1, "unit"    # I
    .param p2, "size"    # F

    .prologue
    .line 366
    iput p1, p0, Lin/uncod/android/bypass/Bypass$Options;->mListItemIndentUnit:I

    .line 367
    iput p2, p0, Lin/uncod/android/bypass/Bypass$Options;->mListItemIndentSize:F

    .line 368
    return-object p0
.end method

.method public setUnorderedListItem(Ljava/lang/String;)Lin/uncod/android/bypass/Bypass$Options;
    .registers 2
    .param p1, "unorderedListItem"    # Ljava/lang/String;

    .prologue
    .line 361
    iput-object p1, p0, Lin/uncod/android/bypass/Bypass$Options;->mUnorderedListItem:Ljava/lang/String;

    .line 362
    return-object p0
.end method
