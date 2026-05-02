.class public abstract Lorg/androidannotations/api/builder/IntentBuilder;
.super Lorg/androidannotations/api/builder/Builder;
.source "IntentBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Lorg/androidannotations/api/builder/IntentBuilder",
        "<TI;>;>",
        "Lorg/androidannotations/api/builder/Builder;"
    }
.end annotation


# instance fields
.field protected final context:Landroid/content/Context;

.field protected final intent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 36
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    invoke-direct {p0}, Lorg/androidannotations/api/builder/Builder;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/androidannotations/api/builder/IntentBuilder;->context:Landroid/content/Context;

    .line 38
    iput-object p2, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Class;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-direct {p0, p1, v0}, Lorg/androidannotations/api/builder/IntentBuilder;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    .line 34
    return-void
.end method


# virtual methods
.method public action(Ljava/lang/String;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 3
    .param p1, "action"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    return-object p0
.end method

.method public extra(Ljava/lang/String;B)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "B)TI;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;B)Landroid/content/Intent;

    .line 66
    return-object p0
.end method

.method public extra(Ljava/lang/String;C)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "C)TI;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;C)Landroid/content/Intent;

    .line 71
    return-object p0
.end method

.method public extra(Ljava/lang/String;D)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D)TI;"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 96
    return-object p0
.end method

.method public extra(Ljava/lang/String;F)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F)TI;"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 91
    return-object p0
.end method

.method public extra(Ljava/lang/String;I)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)TI;"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 81
    return-object p0
.end method

.method public extra(Ljava/lang/String;J)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J)TI;"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 86
    return-object p0
.end method

.method public extra(Ljava/lang/String;Landroid/os/Bundle;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 185
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 186
    return-object p0
.end method

.method public extra(Ljava/lang/String;Landroid/os/Parcelable;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/Parcelable;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 111
    return-object p0
.end method

.method public extra(Ljava/lang/String;Ljava/io/Serializable;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 136
    return-object p0
.end method

.method public extra(Ljava/lang/String;Ljava/lang/CharSequence;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/CharSequence;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 106
    return-object p0
.end method

.method public extra(Ljava/lang/String;Ljava/lang/String;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 101
    return-object p0
.end method

.method public extra(Ljava/lang/String;S)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # S
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "S)TI;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;S)Landroid/content/Intent;

    .line 76
    return-object p0
.end method

.method public extra(Ljava/lang/String;Z)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)TI;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 61
    return-object p0
.end method

.method public extra(Ljava/lang/String;[B)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B)TI;"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 146
    return-object p0
.end method

.method public extra(Ljava/lang/String;[C)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[C)TI;"
        }
    .end annotation

    .prologue
    .line 155
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[C)Landroid/content/Intent;

    .line 156
    return-object p0
.end method

.method public extra(Ljava/lang/String;[D)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[D)TI;"
        }
    .end annotation

    .prologue
    .line 175
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[D)Landroid/content/Intent;

    .line 176
    return-object p0
.end method

.method public extra(Ljava/lang/String;[F)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[F)TI;"
        }
    .end annotation

    .prologue
    .line 170
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[F)Landroid/content/Intent;

    .line 171
    return-object p0
.end method

.method public extra(Ljava/lang/String;[I)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[I)TI;"
        }
    .end annotation

    .prologue
    .line 160
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    .line 161
    return-object p0
.end method

.method public extra(Ljava/lang/String;[J)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[J)TI;"
        }
    .end annotation

    .prologue
    .line 165
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 166
    return-object p0
.end method

.method public extra(Ljava/lang/String;[Landroid/os/Parcelable;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Landroid/os/Parcelable;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 116
    return-object p0
.end method

.method public extra(Ljava/lang/String;[Ljava/lang/String;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 180
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    return-object p0
.end method

.method public extra(Ljava/lang/String;[S)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [S
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[S)TI;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[S)Landroid/content/Intent;

    .line 151
    return-object p0
.end method

.method public extra(Ljava/lang/String;[Z)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[Z)TI;"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Z)Landroid/content/Intent;

    .line 141
    return-object p0
.end method

.method public extras(Landroid/content/Intent;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 3
    .param p1, "src"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 191
    return-object p0
.end method

.method public flags(I)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 3
    .param p1, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TI;"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 51
    return-object p0
.end method

.method public get()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 46
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 42
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->context:Landroid/content/Context;

    return-object v0
.end method

.method public integerArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)TI;"
        }
    .end annotation

    .prologue
    .line 125
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    .local p2, "value":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putIntegerArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 126
    return-object p0
.end method

.method public parcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<+",
            "Landroid/os/Parcelable;",
            ">;)TI;"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    .local p2, "value":Ljava/util/ArrayList;, "Ljava/util/ArrayList<+Landroid/os/Parcelable;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 121
    return-object p0
.end method

.method public stringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Lorg/androidannotations/api/builder/IntentBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)TI;"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "this":Lorg/androidannotations/api/builder/IntentBuilder;, "Lorg/androidannotations/api/builder/IntentBuilder<TI;>;"
    .local p2, "value":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/IntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 131
    return-object p0
.end method
