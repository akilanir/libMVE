.class final Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
.super Lcom/google/android/exoplayer/extractor/mp4/Atom;
.source "Atom.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/mp4/Atom;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ContainerAtom"
.end annotation


# instance fields
.field public final containerChildren:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;",
            ">;"
        }
    .end annotation
.end field

.field public final endPosition:J

.field public final leafChildren:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(IJ)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "endPosition"    # J

    .prologue
    .line 171
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/Atom;-><init>(I)V

    .line 172
    iput-wide p2, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->endPosition:J

    .line 173
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    .line 174
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    .line 175
    return-void
.end method


# virtual methods
.method public add(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V
    .registers 3
    .param p1, "atom"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    return-void
.end method

.method public add(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;)V
    .registers 3
    .param p1, "atom"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    .prologue
    .line 183
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    return-void
.end method

.method public getChildAtomOfTypeCount(I)I
    .registers 7
    .param p1, "type"    # I

    .prologue
    .line 242
    const/4 v1, 0x0

    .line 243
    .local v1, "count":I
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 244
    .local v3, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    if-ge v2, v3, :cond_1b

    .line 245
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    .line 246
    .local v0, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    if-ne v4, p1, :cond_18

    .line 247
    add-int/lit8 v1, v1, 0x1

    .line 244
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 250
    .end local v0    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_1b
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 251
    const/4 v2, 0x0

    :goto_22
    if-ge v2, v3, :cond_35

    .line 252
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .line 253
    .local v0, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    if-ne v4, p1, :cond_32

    .line 254
    add-int/lit8 v1, v1, 0x1

    .line 251
    :cond_32
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    .line 257
    .end local v0    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    :cond_35
    return v1
.end method

.method public getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .registers 6
    .param p1, "type"    # I

    .prologue
    .line 225
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .line 226
    .local v1, "childrenSize":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v1, :cond_19

    .line 227
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .line 228
    .local v0, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    iget v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    if-ne v3, p1, :cond_16

    .line 232
    .end local v0    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    :goto_15
    return-object v0

    .line 226
    .restart local v0    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 232
    .end local v0    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    :cond_19
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .registers 6
    .param p1, "type"    # I

    .prologue
    .line 205
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .line 206
    .local v1, "childrenSize":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v1, :cond_19

    .line 207
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    .line 208
    .local v0, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    iget v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    if-ne v3, p1, :cond_16

    .line 212
    .end local v0    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :goto_15
    return-object v0

    .line 206
    .restart local v0    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 212
    .end local v0    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_19
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 262
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    invoke-static {v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getAtomTypeString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " leaves: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    new-array v2, v3, [Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " containers: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    new-array v2, v3, [Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
