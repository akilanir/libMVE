.class final Ltimber/log/Timber$1;
.super Ltimber/log/Timber$Tree;
.source "Timber.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltimber/log/Timber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 156
    invoke-direct {p0}, Ltimber/log/Timber$Tree;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 174
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 176
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 177
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2}, Ltimber/log/Timber$Tree;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 176
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 179
    :cond_e
    return-void
.end method

.method public varargs d(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 182
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 184
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 185
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->d(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 184
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 187
    :cond_e
    return-void
.end method

.method public varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 222
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 224
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 225
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2}, Ltimber/log/Timber$Tree;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 224
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 227
    :cond_e
    return-void
.end method

.method public varargs e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 230
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 232
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 233
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 232
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 235
    :cond_e
    return-void
.end method

.method public varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 190
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 192
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 193
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2}, Ltimber/log/Timber$Tree;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 192
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 195
    :cond_e
    return-void
.end method

.method public varargs i(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 198
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 200
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 201
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->i(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 200
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 203
    :cond_e
    return-void
.end method

.method protected log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 7
    .param p1, "priority"    # I
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 270
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Missing override for log method."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public varargs log(ILjava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "priority"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 254
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 256
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 257
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 256
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 259
    :cond_e
    return-void
.end method

.method public varargs log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 9
    .param p1, "priority"    # I
    .param p2, "t"    # Ljava/lang/Throwable;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 262
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 264
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 265
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2, p3, p4}, Ltimber/log/Timber$Tree;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 264
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 267
    :cond_e
    return-void
.end method

.method public varargs v(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 158
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 160
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 161
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2}, Ltimber/log/Timber$Tree;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 160
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 163
    :cond_e
    return-void
.end method

.method public varargs v(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 166
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 168
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 169
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->v(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 168
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 171
    :cond_e
    return-void
.end method

.method public varargs w(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 206
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 208
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 209
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2}, Ltimber/log/Timber$Tree;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 208
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 211
    :cond_e
    return-void
.end method

.method public varargs w(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 214
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 216
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 217
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->w(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 216
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 219
    :cond_e
    return-void
.end method

.method public varargs wtf(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 238
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 240
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 241
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2}, Ltimber/log/Timber$Tree;->wtf(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 243
    :cond_e
    return-void
.end method

.method public varargs wtf(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 246
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 248
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_e

    .line 249
    aget-object v3, v1, v2

    invoke-virtual {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->wtf(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 248
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 251
    :cond_e
    return-void
.end method
