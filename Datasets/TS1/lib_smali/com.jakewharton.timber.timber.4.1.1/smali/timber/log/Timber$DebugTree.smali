.class public Ltimber/log/Timber$DebugTree;
.super Ltimber/log/Timber$Tree;
.source "Timber.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltimber/log/Timber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DebugTree"
.end annotation


# static fields
.field private static final ANONYMOUS_CLASS:Ljava/util/regex/Pattern;

.field private static final CALL_STACK_INDEX:I = 0x5

.field private static final MAX_LOG_LENGTH:I = 0xfa0


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 414
    const-string v0, "(\\$\\d+)+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Ltimber/log/Timber$DebugTree;->ANONYMOUS_CLASS:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 411
    invoke-direct {p0}, Ltimber/log/Timber$Tree;-><init>()V

    return-void
.end method


# virtual methods
.method protected createStackElementTag(Ljava/lang/StackTraceElement;)Ljava/lang/String;
    .registers 5
    .param p1, "element"    # Ljava/lang/StackTraceElement;

    .prologue
    .line 424
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 425
    .local v1, "tag":Ljava/lang/String;
    sget-object v2, Ltimber/log/Timber$DebugTree;->ANONYMOUS_CLASS:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 426
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 427
    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 429
    :cond_16
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method final getTag()Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v3, 0x5

    .line 433
    invoke-super {p0}, Ltimber/log/Timber$Tree;->getTag()Ljava/lang/String;

    move-result-object v1

    .line 434
    .local v1, "tag":Ljava/lang/String;
    if-eqz v1, :cond_8

    .line 445
    .end local v1    # "tag":Ljava/lang/String;
    :goto_7
    return-object v1

    .line 440
    .restart local v1    # "tag":Ljava/lang/String;
    :cond_8
    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 441
    .local v0, "stackTrace":[Ljava/lang/StackTraceElement;
    array-length v2, v0

    if-gt v2, v3, :cond_1c

    .line 442
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Synthetic stacktrace didn\'t have enough elements: are you using proguard?"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 445
    :cond_1c
    aget-object v2, v0, v3

    invoke-virtual {p0, v2}, Ltimber/log/Timber$DebugTree;->createStackElementTag(Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method protected log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 13
    .param p1, "priority"    # I
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v7, 0x7

    .line 456
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0xfa0

    if-ge v5, v6, :cond_13

    .line 457
    if-ne p1, v7, :cond_f

    .line 458
    invoke-static {p2, p3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    :cond_e
    :goto_e
    return-void

    .line 460
    :cond_f
    invoke-static {p1, p2, p3}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    goto :goto_e

    .line 466
    :cond_13
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    .local v2, "length":I
    :goto_18
    if-ge v1, v2, :cond_e

    .line 467
    const/16 v5, 0xa

    invoke-virtual {p3, v5, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 468
    .local v3, "newline":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_38

    .line 470
    :cond_23
    :goto_23
    add-int/lit16 v5, v1, 0xfa0

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 471
    .local v0, "end":I
    invoke-virtual {p3, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 472
    .local v4, "part":Ljava/lang/String;
    if-ne p1, v7, :cond_3a

    .line 473
    invoke-static {p2, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    :goto_32
    move v1, v0

    .line 478
    if-lt v1, v3, :cond_23

    .line 466
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .end local v0    # "end":I
    .end local v4    # "part":Ljava/lang/String;
    :cond_38
    move v3, v2

    .line 468
    goto :goto_23

    .line 475
    .restart local v0    # "end":I
    .restart local v4    # "part":Ljava/lang/String;
    :cond_3a
    invoke-static {p1, p2, v4}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    goto :goto_32
.end method
