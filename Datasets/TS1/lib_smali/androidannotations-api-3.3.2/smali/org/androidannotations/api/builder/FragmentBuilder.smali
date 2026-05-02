.class public abstract Lorg/androidannotations/api/builder/FragmentBuilder;
.super Lorg/androidannotations/api/builder/Builder;
.source "FragmentBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Lorg/androidannotations/api/builder/FragmentBuilder",
        "<TI;TF;>;F:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/androidannotations/api/builder/Builder;"
    }
.end annotation


# instance fields
.field protected args:Landroid/os/Bundle;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    invoke-direct {p0}, Lorg/androidannotations/api/builder/Builder;-><init>()V

    .line 31
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    .line 32
    return-void
.end method


# virtual methods
.method public arg(Landroid/os/Bundle;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 3
    .param p1, "map"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")TI;"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 38
    return-object p0
.end method

.method public arg(Ljava/lang/String;B)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "B)TI;"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putByte(Ljava/lang/String;B)V

    .line 48
    return-object p0
.end method

.method public arg(Ljava/lang/String;C)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "C)TI;"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putChar(Ljava/lang/String;C)V

    .line 53
    return-object p0
.end method

.method public arg(Ljava/lang/String;D)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D)TI;"
        }
    .end annotation

    .prologue
    .line 77
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    .line 78
    return-object p0
.end method

.method public arg(Ljava/lang/String;F)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F)TI;"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 73
    return-object p0
.end method

.method public arg(Ljava/lang/String;I)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)TI;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 63
    return-object p0
.end method

.method public arg(Ljava/lang/String;J)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J)TI;"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 68
    return-object p0
.end method

.method public arg(Ljava/lang/String;Landroid/os/Bundle;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 172
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 173
    return-object p0
.end method

.method public arg(Ljava/lang/String;Landroid/os/Parcelable;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 92
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 93
    return-object p0
.end method

.method public arg(Ljava/lang/String;Landroid/util/SparseArray;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray",
            "<+",
            "Landroid/os/Parcelable;",
            ">;)TI;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    .local p2, "value":Landroid/util/SparseArray;, "Landroid/util/SparseArray<+Landroid/os/Parcelable;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 108
    return-object p0
.end method

.method public arg(Ljava/lang/String;Ljava/io/Serializable;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 122
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 123
    return-object p0
.end method

.method public arg(Ljava/lang/String;Ljava/lang/CharSequence;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 87
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 88
    return-object p0
.end method

.method public arg(Ljava/lang/String;Ljava/lang/String;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 82
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    return-object p0
.end method

.method public arg(Ljava/lang/String;S)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # S
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "S)TI;"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putShort(Ljava/lang/String;S)V

    .line 58
    return-object p0
.end method

.method public arg(Ljava/lang/String;Z)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)TI;"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 43
    return-object p0
.end method

.method public arg(Ljava/lang/String;[B)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B)TI;"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 133
    return-object p0
.end method

.method public arg(Ljava/lang/String;[C)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # [C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[C)TI;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putCharArray(Ljava/lang/String;[C)V

    .line 143
    return-object p0
.end method

.method public arg(Ljava/lang/String;[D)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # [D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[D)TI;"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putDoubleArray(Ljava/lang/String;[D)V

    .line 163
    return-object p0
.end method

.method public arg(Ljava/lang/String;[F)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # [F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[F)TI;"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    .line 158
    return-object p0
.end method

.method public arg(Ljava/lang/String;[I)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[I)TI;"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 148
    return-object p0
.end method

.method public arg(Ljava/lang/String;[J)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # [J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[J)TI;"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    .line 153
    return-object p0
.end method

.method public arg(Ljava/lang/String;[Landroid/os/Parcelable;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 97
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 98
    return-object p0
.end method

.method public arg(Ljava/lang/String;[Ljava/lang/String;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 167
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 168
    return-object p0
.end method

.method public arg(Ljava/lang/String;[S)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # [S
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[S)TI;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putShortArray(Ljava/lang/String;[S)V

    .line 138
    return-object p0
.end method

.method public arg(Ljava/lang/String;[Z)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # [Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[Z)TI;"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putBooleanArray(Ljava/lang/String;[Z)V

    .line 128
    return-object p0
.end method

.method public args()Landroid/os/Bundle;
    .registers 2

    .prologue
    .line 177
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    return-object v0
.end method

.method public abstract build()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TF;"
        }
    .end annotation
.end method

.method public integerArrayListArg(Ljava/lang/String;Ljava/util/ArrayList;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 112
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    .local p2, "value":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 113
    return-object p0
.end method

.method public parcelableArrayListArg(Ljava/lang/String;Ljava/util/ArrayList;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 102
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    .local p2, "value":Ljava/util/ArrayList;, "Ljava/util/ArrayList<+Landroid/os/Parcelable;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 103
    return-object p0
.end method

.method public stringArrayListArg(Ljava/lang/String;Ljava/util/ArrayList;)Lorg/androidannotations/api/builder/FragmentBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
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
    .line 117
    .local p0, "this":Lorg/androidannotations/api/builder/FragmentBuilder;, "Lorg/androidannotations/api/builder/FragmentBuilder<TI;TF;>;"
    .local p2, "value":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/FragmentBuilder;->args:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 118
    return-object p0
.end method
