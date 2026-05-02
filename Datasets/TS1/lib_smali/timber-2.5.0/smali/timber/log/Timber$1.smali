.class final Ltimber/log/Timber$1;
.super Ljava/lang/Object;
.source "Timber.java"

# interfaces
.implements Ltimber/log/Timber$Tree;


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
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 129
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 131
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 132
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2}, Ltimber/log/Timber$Tree;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 131
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 134
    :cond_15
    return-void
.end method

.method public varargs d(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 137
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 139
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 140
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->d(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 139
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 142
    :cond_15
    return-void
.end method

.method public varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 177
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 179
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 180
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2}, Ltimber/log/Timber$Tree;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 179
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 182
    :cond_15
    return-void
.end method

.method public varargs e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 185
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 187
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 188
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 187
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 190
    :cond_15
    return-void
.end method

.method public varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 145
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 147
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 148
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2}, Ltimber/log/Timber$Tree;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 147
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 150
    :cond_15
    return-void
.end method

.method public varargs i(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 153
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 155
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 156
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->i(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 155
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 158
    :cond_15
    return-void
.end method

.method public varargs v(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 113
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 115
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 116
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2}, Ltimber/log/Timber$Tree;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 115
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 118
    :cond_15
    return-void
.end method

.method public varargs v(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 121
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 123
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 124
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->v(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 123
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 126
    :cond_15
    return-void
.end method

.method public varargs w(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 161
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 163
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 164
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2}, Ltimber/log/Timber$Tree;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 163
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 166
    :cond_15
    return-void
.end method

.method public varargs w(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 169
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 171
    .local v1, "forest":Ljava/util/List;, "Ljava/util/List<Ltimber/log/Timber$Tree;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7
    if-ge v2, v0, :cond_15

    .line 172
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltimber/log/Timber$Tree;

    invoke-interface {v3, p1, p2, p3}, Ltimber/log/Timber$Tree;->w(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 171
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 174
    :cond_15
    return-void
.end method
