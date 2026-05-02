.class public final Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;
.super Ljava/lang/Object;
.source "ShadowDocument.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/ShadowDocument;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "UpdateBuilder"
.end annotation


# instance fields
.field private mCachedNotNewChildrenSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mElementToInfoChangesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lcom/facebook/stetho/inspector/elements/ElementInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mRootElementChanges:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)V
    .registers 3
    .param p1, "this$0"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    .line 99
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    return-void
.end method

.method private acquireNotNewChildrenHashSet()Ljava/util/HashSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 246
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mCachedNotNewChildrenSet:Ljava/util/HashSet;

    .line 247
    .local v0, "notNewChildrenHashSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    if-nez v0, :cond_9

    .line 248
    new-instance v0, Ljava/util/HashSet;

    .end local v0    # "notNewChildrenHashSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 250
    .restart local v0    # "notNewChildrenHashSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    :cond_9
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mCachedNotNewChildrenSet:Ljava/util/HashSet;

    .line 251
    return-object v0
.end method

.method private releaseNotNewChildrenHashSet(Ljava/util/HashSet;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 255
    .local p1, "notNewChildrenHashSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    invoke-virtual {p1}, Ljava/util/HashSet;->clear()V

    .line 256
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mCachedNotNewChildrenSet:Ljava/util/HashSet;

    if-nez v0, :cond_9

    .line 257
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mCachedNotNewChildrenSet:Ljava/util/HashSet;

    .line 259
    :cond_9
    return-void
.end method

.method private setElementParent(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 9
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "parentElement"    # Ljava/lang/Object;

    .prologue
    .line 199
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 200
    .local v0, "changesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v0, :cond_f

    iget-object v4, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne p2, v4, :cond_f

    .line 239
    :cond_e
    :goto_e
    return-void

    .line 205
    :cond_f
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    # getter for: Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mElementToInfoMap:Ljava/util/IdentityHashMap;
    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 206
    .local v3, "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-nez v0, :cond_23

    if-eqz v3, :cond_23

    iget-object v4, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-eq p2, v4, :cond_e

    .line 212
    :cond_23
    if-eqz v0, :cond_42

    if-eqz v3, :cond_42

    iget-object v4, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne p2, v4, :cond_42

    iget-object v4, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    iget-object v5, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 215
    invoke-static {v4, v5}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_42

    .line 216
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    if-nez p2, :cond_e

    .line 219
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    invoke-virtual {v4, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_e

    .line 225
    :cond_42
    if-eqz v0, :cond_58

    iget-object v1, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 231
    .local v1, "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :goto_46
    new-instance v2, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    invoke-direct {v2, p1, p2, v1}, Lcom/facebook/stetho/inspector/elements/ElementInfo;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/List;)V

    .line 232
    .local v2, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v4, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    if-nez p2, :cond_62

    .line 235
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    invoke-virtual {v4, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 225
    .end local v1    # "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v2    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_58
    if-eqz v3, :cond_5d

    iget-object v1, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    goto :goto_46

    .line 229
    :cond_5d
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    goto :goto_46

    .line 237
    .restart local v1    # "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v2    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_62
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    invoke-virtual {v4, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_e
.end method


# virtual methods
.method public build()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;
    .registers 5

    .prologue
    .line 242
    new-instance v0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;-><init>(Lcom/facebook/stetho/inspector/elements/ShadowDocument;Ljava/util/Map;Ljava/util/Set;)V

    return-object v0
.end method

.method public setElementChildren(Ljava/lang/Object;Ljava/util/List;)V
    .registers 16
    .param p1, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v10, 0x0

    .line 108
    iget-object v11, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v11, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 109
    .local v1, "changesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v1, :cond_14

    iget-object v11, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 110
    invoke-static {p2, v11}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v11

    if-eqz v11, :cond_14

    .line 196
    :cond_13
    :goto_13
    return-void

    .line 114
    :cond_14
    iget-object v11, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    # getter for: Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mElementToInfoMap:Ljava/util/IdentityHashMap;
    invoke-static {v11}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 115
    .local v8, "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-nez v1, :cond_2c

    if-eqz v8, :cond_2c

    iget-object v11, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 117
    invoke-static {p2, v11}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v11

    if-nez v11, :cond_13

    .line 122
    :cond_2c
    if-eqz v1, :cond_70

    if-eqz v8, :cond_70

    iget-object v11, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    iget-object v12, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne v11, v12, :cond_70

    iget-object v11, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 125
    invoke-static {p2, v11}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v11

    if-eqz v11, :cond_70

    .line 129
    iget-object v11, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    # getter for: Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mElementToInfoMap:Ljava/util/IdentityHashMap;
    invoke-static {v11}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 130
    .local v5, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v11, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v11, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    :goto_4f
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->acquireNotNewChildrenHashSet()Ljava/util/HashSet;

    move-result-object v6

    .line 158
    .local v6, "notNewChildrenSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    if-eqz v8, :cond_86

    iget-object v11, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    iget-object v12, v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    if-eq v11, v12, :cond_86

    .line 160
    const/4 v4, 0x0

    .local v4, "i":I
    iget-object v11, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "N":I
    :goto_62
    if-ge v4, v0, :cond_86

    .line 161
    iget-object v11, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v11, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 162
    .local v3, "childElement":Ljava/lang/Object;
    invoke-virtual {v6, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 160
    add-int/lit8 v4, v4, 0x1

    goto :goto_62

    .line 132
    .end local v0    # "N":I
    .end local v3    # "childElement":Ljava/lang/Object;
    .end local v4    # "i":I
    .end local v5    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .end local v6    # "notNewChildrenSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    :cond_70
    if-eqz v1, :cond_7f

    iget-object v9, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    .line 138
    .local v9, "parentElement":Ljava/lang/Object;
    :goto_74
    new-instance v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    invoke-direct {v5, p1, v9, p2}, Lcom/facebook/stetho/inspector/elements/ElementInfo;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/List;)V

    .line 140
    .restart local v5    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v11, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v11, p1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4f

    .line 132
    .end local v5    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .end local v9    # "parentElement":Ljava/lang/Object;
    :cond_7f
    if-eqz v8, :cond_84

    iget-object v9, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    goto :goto_74

    :cond_84
    move-object v9, v10

    goto :goto_74

    .line 166
    .restart local v5    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .restart local v6    # "notNewChildrenSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    :cond_86
    if-eqz v1, :cond_a3

    iget-object v11, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    iget-object v12, v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    if-eq v11, v12, :cond_a3

    .line 168
    const/4 v4, 0x0

    .restart local v4    # "i":I
    iget-object v11, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v0

    .restart local v0    # "N":I
    :goto_95
    if-ge v4, v0, :cond_a3

    .line 169
    iget-object v11, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v11, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 170
    .restart local v3    # "childElement":Ljava/lang/Object;
    invoke-virtual {v6, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 168
    add-int/lit8 v4, v4, 0x1

    goto :goto_95

    .line 174
    .end local v0    # "N":I
    .end local v3    # "childElement":Ljava/lang/Object;
    .end local v4    # "i":I
    :cond_a3
    const/4 v4, 0x0

    .restart local v4    # "i":I
    iget-object v11, v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v0

    .restart local v0    # "N":I
    :goto_aa
    if-ge v4, v0, :cond_bb

    .line 175
    iget-object v11, v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v11, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 176
    .restart local v3    # "childElement":Ljava/lang/Object;
    invoke-direct {p0, v3, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->setElementParent(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 177
    invoke-virtual {v6, v3}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 174
    add-int/lit8 v4, v4, 0x1

    goto :goto_aa

    .line 180
    .end local v3    # "childElement":Ljava/lang/Object;
    :cond_bb
    invoke-virtual {v6}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_bf
    :goto_bf
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_ed

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 181
    .restart local v3    # "childElement":Ljava/lang/Object;
    iget-object v12, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v12, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 182
    .local v2, "childChangesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v2, :cond_d7

    iget-object v12, v2, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne v12, p1, :cond_bf

    .line 188
    :cond_d7
    iget-object v12, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    # getter for: Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mElementToInfoMap:Ljava/util/IdentityHashMap;
    invoke-static {v12}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 189
    .local v7, "oldChangesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v7, :cond_bf

    iget-object v12, v7, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne v12, p1, :cond_bf

    .line 191
    invoke-direct {p0, v3, v10}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->setElementParent(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_bf

    .line 195
    .end local v2    # "childChangesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .end local v3    # "childElement":Ljava/lang/Object;
    .end local v7    # "oldChangesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_ed
    invoke-direct {p0, v6}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->releaseNotNewChildrenHashSet(Ljava/util/HashSet;)V

    goto/16 :goto_13
.end method
