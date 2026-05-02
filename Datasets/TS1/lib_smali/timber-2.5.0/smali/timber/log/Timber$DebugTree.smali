.class public Ltimber/log/Timber$DebugTree;
.super Ljava/lang/Object;
.source "Timber.java"

# interfaces
.implements Ltimber/log/Timber$TaggedTree;


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

.field private static final NEXT_TAG:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 237
    const-string v0, "\\$\\d+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Ltimber/log/Timber$DebugTree;->ANONYMOUS_CLASS:Ljava/util/regex/Pattern;

    .line 238
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Ltimber/log/Timber$DebugTree;->NEXT_TAG:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createTag()Ljava/lang/String;
    .registers 5

    .prologue
    .line 241
    sget-object v3, Ltimber/log/Timber$DebugTree;->NEXT_TAG:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 242
    .local v2, "tag":Ljava/lang/String;
    if-eqz v2, :cond_10

    .line 243
    sget-object v3, Ltimber/log/Timber$DebugTree;->NEXT_TAG:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->remove()V

    .line 257
    .end local v2    # "tag":Ljava/lang/String;
    :goto_f
    return-object v2

    .line 247
    .restart local v2    # "tag":Ljava/lang/String;
    :cond_10
    new-instance v3, Ljava/lang/Throwable;

    invoke-direct {v3}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 248
    .local v1, "stackTrace":[Ljava/lang/StackTraceElement;
    array-length v3, v1

    const/4 v4, 0x6

    if-ge v3, v4, :cond_25

    .line 249
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Synthetic stacktrace didn\'t have enough elements: are you using proguard?"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 252
    :cond_25
    const/4 v3, 0x5

    aget-object v3, v1, v3

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    .line 253
    sget-object v3, Ltimber/log/Timber$DebugTree;->ANONYMOUS_CLASS:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 254
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 255
    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 257
    :cond_3e
    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_f
.end method

.method static varargs formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 262
    array-length v0, p1

    if-nez v0, :cond_4

    .end local p0    # "message":Ljava/lang/String;
    :goto_3
    return-object p0

    .restart local p0    # "message":Ljava/lang/String;
    :cond_4
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method private throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V
    .registers 9
    .param p1, "priority"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 306
    if-eqz p2, :cond_8

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1e

    .line 307
    :cond_8
    if-eqz p3, :cond_1d

    .line 308
    invoke-static {p3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    .line 317
    :cond_e
    :goto_e
    invoke-static {}, Ltimber/log/Timber$DebugTree;->createTag()Ljava/lang/String;

    move-result-object v2

    .line 318
    .local v2, "tag":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0xfa0

    if-ge v3, v4, :cond_3c

    .line 319
    invoke-static {p1, v2, p2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 329
    .end local v2    # "tag":Ljava/lang/String;
    :cond_1d
    return-void

    .line 313
    :cond_1e
    if-eqz p3, :cond_e

    .line 314
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_e

    .line 324
    .restart local v2    # "tag":Ljava/lang/String;
    :cond_3c
    const-string v3, "\n"

    invoke-virtual {p2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 325
    .local v1, "lines":[Ljava/lang/String;
    array-length v4, v1

    const/4 v3, 0x0

    :goto_44
    if-ge v3, v4, :cond_1d

    aget-object v0, v1, v3

    .line 326
    .local v0, "line":Ljava/lang/String;
    invoke-static {p1, v2, v0}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 325
    add-int/lit8 v3, v3, 0x1

    goto :goto_44
.end method


# virtual methods
.method public varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 274
    const/4 v0, 0x3

    invoke-static {p1, p2}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 275
    return-void
.end method

.method public varargs d(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 278
    const/4 v0, 0x3

    invoke-static {p2, p3}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p1}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 279
    return-void
.end method

.method public varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 298
    const/4 v0, 0x6

    invoke-static {p1, p2}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 299
    return-void
.end method

.method public varargs e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 302
    const/4 v0, 0x6

    invoke-static {p2, p3}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p1}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 303
    return-void
.end method

.method public varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 282
    const/4 v0, 0x4

    invoke-static {p1, p2}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 283
    return-void
.end method

.method public varargs i(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 286
    const/4 v0, 0x4

    invoke-static {p2, p3}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p1}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 287
    return-void
.end method

.method public tag(Ljava/lang/String;)V
    .registers 3
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 332
    sget-object v0, Ltimber/log/Timber$DebugTree;->NEXT_TAG:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 333
    return-void
.end method

.method public varargs v(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 266
    const/4 v0, 0x2

    invoke-static {p1, p2}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 267
    return-void
.end method

.method public varargs v(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 270
    const/4 v0, 0x2

    invoke-static {p2, p3}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p1}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 271
    return-void
.end method

.method public varargs w(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 290
    const/4 v0, 0x5

    invoke-static {p1, p2}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 291
    return-void
.end method

.method public varargs w(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 294
    const/4 v0, 0x5

    invoke-static {p2, p3}, Ltimber/log/Timber$DebugTree;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p1}, Ltimber/log/Timber$DebugTree;->throwShade(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 295
    return-void
.end method
