.class final Lbutterknife/internal/ViewInjector;
.super Ljava/lang/Object;
.source "ViewInjector.java"


# instance fields
.field private final className:Ljava/lang/String;

.field private final classPackage:Ljava/lang/String;

.field private final collectionBindings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lbutterknife/internal/CollectionBinding;",
            "[I>;"
        }
    .end annotation
.end field

.field private parentInjector:Ljava/lang/String;

.field private final targetClass:Ljava/lang/String;

.field private final viewIdMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lbutterknife/internal/ViewInjection;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "classPackage"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "targetClass"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lbutterknife/internal/ViewInjector;->viewIdMap:Ljava/util/Map;

    .line 18
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lbutterknife/internal/ViewInjector;->collectionBindings:Ljava/util/Map;

    .line 26
    iput-object p1, p0, Lbutterknife/internal/ViewInjector;->classPackage:Ljava/lang/String;

    .line 27
    iput-object p2, p0, Lbutterknife/internal/ViewInjector;->className:Ljava/lang/String;

    .line 28
    iput-object p3, p0, Lbutterknife/internal/ViewInjector;->targetClass:Ljava/lang/String;

    .line 29
    return-void
.end method

.method static emitCastIfNeeded(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .registers 3
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "viewType"    # Ljava/lang/String;

    .prologue
    .line 358
    const-string v0, "android.view.View"

    invoke-static {p0, v0, p1}, Lbutterknife/internal/ViewInjector;->emitCastIfNeeded(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    return-void
.end method

.method static emitCastIfNeeded(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "sourceType"    # Ljava/lang/String;
    .param p2, "destinationType"    # Ljava/lang/String;

    .prologue
    .line 363
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 364
    const/16 v0, 0x28

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    :cond_15
    return-void
.end method

.method private emitCollectionBinding(Ljava/lang/StringBuilder;Lbutterknife/internal/CollectionBinding;[I)V
    .registers 8
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "binding"    # Lbutterknife/internal/CollectionBinding;
    .param p3, "ids"    # [I

    .prologue
    .line 114
    const-string v1, "    target."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lbutterknife/internal/CollectionBinding;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    sget-object v1, Lbutterknife/internal/ViewInjector$1;->$SwitchMap$butterknife$internal$CollectionBinding$Kind:[I

    invoke-virtual {p2}, Lbutterknife/internal/CollectionBinding;->getKind()Lbutterknife/internal/CollectionBinding$Kind;

    move-result-object v2

    invoke-virtual {v2}, Lbutterknife/internal/CollectionBinding$Kind;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_a2

    .line 124
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown kind: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lbutterknife/internal/CollectionBinding;->getKind()Lbutterknife/internal/CollectionBinding$Kind;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 118
    :pswitch_3f
    const-string v1, "Finder.arrayOf("

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    :goto_44
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_45
    array-length v1, p3

    if-ge v0, v1, :cond_9b

    .line 128
    if-lez v0, :cond_4f

    .line 129
    const/16 v1, 0x2c

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 131
    :cond_4f
    const-string v1, "\n        "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    invoke-virtual {p2}, Lbutterknife/internal/CollectionBinding;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lbutterknife/internal/ViewInjector;->emitCastIfNeeded(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 133
    invoke-virtual {p2}, Lbutterknife/internal/CollectionBinding;->isRequired()Z

    move-result v1

    if-eqz v1, :cond_89

    .line 134
    const-string v1, "finder.findRequiredView(source, "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, p3, v0

    .line 135
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", \""

    .line 136
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 137
    invoke-virtual {p2}, Lbutterknife/internal/CollectionBinding;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\")"

    .line 138
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    :goto_80
    add-int/lit8 v0, v0, 0x1

    goto :goto_45

    .line 121
    .end local v0    # "i":I
    :pswitch_83
    const-string v1, "Finder.listOf("

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_44

    .line 140
    .restart local v0    # "i":I
    :cond_89
    const-string v1, "finder.findOptionalView(source, "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, p3, v0

    .line 141
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    .line 142
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_80

    .line 146
    :cond_9b
    const-string v1, "\n    );"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    return-void

    .line 116
    nop

    :pswitch_data_a2
    .packed-switch 0x1
        :pswitch_3f
        :pswitch_83
    .end packed-switch
.end method

.method static emitHumanDescription(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .registers 7
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Lbutterknife/internal/Binding;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "bindings":Ljava/util/List;, "Ljava/util/List<Lbutterknife/internal/Binding;>;"
    const/4 v4, 0x0

    .line 369
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    packed-switch v3, :pswitch_data_60

    .line 379
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_d
    if-ge v1, v0, :cond_3c

    .line 380
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbutterknife/internal/Binding;

    .line 381
    .local v2, "requiredField":Lbutterknife/internal/Binding;
    if-eqz v1, :cond_1c

    .line 382
    const-string v3, ", "

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    :cond_1c
    add-int/lit8 v3, v0, -0x1

    if-ne v1, v3, :cond_25

    .line 385
    const-string v3, "and "

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    :cond_25
    invoke-interface {v2}, Lbutterknife/internal/Binding;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 371
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "requiredField":Lbutterknife/internal/Binding;
    :pswitch_2f
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbutterknife/internal/Binding;

    invoke-interface {v3}, Lbutterknife/internal/Binding;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    :cond_3c
    :goto_3c
    return-void

    .line 374
    :pswitch_3d
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbutterknife/internal/Binding;

    invoke-interface {v3}, Lbutterknife/internal/Binding;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " and "

    .line 375
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v3, 0x1

    .line 376
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbutterknife/internal/Binding;

    invoke-interface {v3}, Lbutterknife/internal/Binding;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3c

    .line 369
    :pswitch_data_60
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_3d
    .end packed-switch
.end method

.method private emitInject(Ljava/lang/StringBuilder;)V
    .registers 7
    .param p1, "builder"    # Ljava/lang/StringBuilder;

    .prologue
    .line 86
    const-string v2, "  public static void inject(Finder finder, final "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lbutterknife/internal/ViewInjector;->targetClass:Ljava/lang/String;

    .line 87
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " target, Object source) {\n"

    .line 88
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    iget-object v2, p0, Lbutterknife/internal/ViewInjector;->parentInjector:Ljava/lang/String;

    if-eqz v2, :cond_26

    .line 92
    const-string v2, "    "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lbutterknife/internal/ViewInjector;->parentInjector:Ljava/lang/String;

    .line 93
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".inject(finder, target, source);\n\n"

    .line 94
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    :cond_26
    const-string v2, "    View view;\n"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    iget-object v2, p0, Lbutterknife/internal/ViewInjector;->viewIdMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_35
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_45

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbutterknife/internal/ViewInjection;

    .line 102
    .local v1, "injection":Lbutterknife/internal/ViewInjection;
    invoke-direct {p0, p1, v1}, Lbutterknife/internal/ViewInjector;->emitViewInjection(Ljava/lang/StringBuilder;Lbutterknife/internal/ViewInjection;)V

    goto :goto_35

    .line 106
    .end local v1    # "injection":Lbutterknife/internal/ViewInjection;
    :cond_45
    iget-object v2, p0, Lbutterknife/internal/ViewInjector;->collectionBindings:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 107
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lbutterknife/internal/CollectionBinding;[I>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbutterknife/internal/CollectionBinding;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    invoke-direct {p0, p1, v2, v3}, Lbutterknife/internal/ViewInjector;->emitCollectionBinding(Ljava/lang/StringBuilder;Lbutterknife/internal/CollectionBinding;[I)V

    goto :goto_4f

    .line 110
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lbutterknife/internal/CollectionBinding;[I>;"
    :cond_6b
    const-string v2, "  }\n"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    return-void
.end method

.method private emitListenerBindings(Ljava/lang/StringBuilder;Lbutterknife/internal/ViewInjection;)V
    .registers 29
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "injection"    # Lbutterknife/internal/ViewInjection;

    .prologue
    .line 189
    .line 190
    invoke-virtual/range {p2 .. p2}, Lbutterknife/internal/ViewInjection;->getListenerBindings()Ljava/util/Map;

    move-result-object v4

    .line 191
    .local v4, "bindings":Ljava/util/Map;, "Ljava/util/Map<Lbutterknife/internal/ListenerClass;Ljava/util/Map<Lbutterknife/internal/ListenerMethod;Ljava/util/Set<Lbutterknife/internal/ListenerBinding;>;>;>;"
    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v22

    if-eqz v22, :cond_b

    .line 313
    :cond_a
    :goto_a
    return-void

    .line 195
    :cond_b
    const-string v7, ""

    .line 198
    .local v7, "extraIndent":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lbutterknife/internal/ViewInjection;->getRequiredBindings()Ljava/util/List;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->isEmpty()Z

    move-result v17

    .line 199
    .local v17, "needsNullChecked":Z
    if-eqz v17, :cond_22

    .line 200
    const-string v22, "    if (view != null) {\n"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    const-string v7, "  "

    .line 205
    :cond_22
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :goto_2a
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_278

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 206
    .local v6, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lbutterknife/internal/ListenerClass;Ljava/util/Map<Lbutterknife/internal/ListenerMethod;Ljava/util/Set<Lbutterknife/internal/ListenerBinding;>;>;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lbutterknife/internal/ListenerClass;

    .line 207
    .local v11, "listener":Lbutterknife/internal/ListenerClass;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/Map;

    .line 210
    .local v15, "methodBindings":Ljava/util/Map;, "Ljava/util/Map<Lbutterknife/internal/ListenerMethod;Ljava/util/Set<Lbutterknife/internal/ListenerBinding;>;>;"
    const-string v23, "android.view.View"

    invoke-interface {v11}, Lbutterknife/internal/ListenerClass;->targetType()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_9d

    const/16 v16, 0x1

    .line 211
    .local v16, "needsCast":Z
    :goto_50
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "    "

    .line 212
    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    if-eqz v16, :cond_b2

    .line 214
    const-string v23, "(("

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-interface {v11}, Lbutterknife/internal/ListenerClass;->targetType()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    invoke-interface {v11}, Lbutterknife/internal/ListenerClass;->genericArguments()I

    move-result v23

    if-lez v23, :cond_a9

    .line 216
    const/16 v23, 0x3c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 217
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_7e
    invoke-interface {v11}, Lbutterknife/internal/ListenerClass;->genericArguments()I

    move-result v23

    move/from16 v0, v23

    if-ge v9, v0, :cond_a0

    .line 218
    if-lez v9, :cond_91

    .line 219
    const-string v23, ", "

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    :cond_91
    const/16 v23, 0x3f

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 217
    add-int/lit8 v9, v9, 0x1

    goto :goto_7e

    .line 210
    .end local v9    # "i":I
    .end local v16    # "needsCast":Z
    :cond_9d
    const/16 v16, 0x0

    goto :goto_50

    .line 223
    .restart local v9    # "i":I
    .restart local v16    # "needsCast":Z
    :cond_a0
    const/16 v23, 0x3e

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 225
    .end local v9    # "i":I
    :cond_a9
    const-string v23, ") "

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    :cond_b2
    const-string v23, "view"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    if-eqz v16, :cond_c6

    .line 229
    const/16 v23, 0x29

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 231
    :cond_c6
    const/16 v23, 0x2e

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v23

    .line 232
    invoke-interface {v11}, Lbutterknife/internal/ListenerClass;->setter()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "(\n"

    .line 233
    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "      new "

    .line 237
    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    .line 238
    invoke-interface {v11}, Lbutterknife/internal/ListenerClass;->type()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "() {\n"

    .line 239
    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    invoke-static {v11}, Lbutterknife/internal/ViewInjector;->getListenerMethods(Lbutterknife/internal/ListenerClass;)Ljava/util/List;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_fe
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_26b

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lbutterknife/internal/ListenerMethod;

    .line 243
    .local v14, "method":Lbutterknife/internal/ListenerMethod;
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "        @Override public "

    .line 244
    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 245
    invoke-interface {v14}, Lbutterknife/internal/ListenerMethod;->returnType()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const/16 v25, 0x20

    .line 246
    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 247
    invoke-interface {v14}, Lbutterknife/internal/ListenerMethod;->name()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "(\n"

    .line 248
    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    invoke-interface {v14}, Lbutterknife/internal/ListenerMethod;->parameters()[Ljava/lang/String;

    move-result-object v19

    .line 252
    .local v19, "parameterTypes":[Ljava/lang/String;
    const/4 v9, 0x0

    .restart local v9    # "i":I
    move-object/from16 v0, v19

    array-length v5, v0

    .local v5, "count":I
    :goto_139
    if-ge v9, v5, :cond_173

    .line 253
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "          "

    .line 254
    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    aget-object v25, v19, v9

    .line 255
    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, " p"

    .line 256
    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 257
    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 258
    add-int/lit8 v24, v5, -0x1

    move/from16 v0, v24

    if-ge v9, v0, :cond_167

    .line 259
    const/16 v24, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 261
    :cond_167
    const/16 v24, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 252
    add-int/lit8 v9, v9, 0x1

    goto :goto_139

    .line 265
    :cond_173
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "        ) {\n"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "          "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    const-string v24, "void"

    invoke-interface {v14}, Lbutterknife/internal/ListenerMethod;->returnType()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_21f

    const/4 v8, 0x1

    .line 270
    .local v8, "hasReturnType":Z
    :goto_196
    if-eqz v8, :cond_1a1

    .line 271
    const-string v24, "return "

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    :cond_1a1
    invoke-interface {v15, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_242

    .line 275
    invoke-interface {v15, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/util/Set;

    .line 276
    .local v21, "set":Ljava/util/Set;, "Ljava/util/Set<Lbutterknife/internal/ListenerBinding;>;"
    invoke-interface/range {v21 .. v21}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .line 278
    .local v10, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lbutterknife/internal/ListenerBinding;>;"
    :cond_1b1
    :goto_1b1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_255

    .line 279
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbutterknife/internal/ListenerBinding;

    .line 280
    .local v3, "binding":Lbutterknife/internal/ListenerBinding;
    const-string v24, "target."

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v3}, Lbutterknife/internal/ListenerBinding;->getName()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const/16 v25, 0x28

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 281
    invoke-virtual {v3}, Lbutterknife/internal/ListenerBinding;->getParameters()Ljava/util/List;

    move-result-object v20

    .line 282
    .local v20, "parameters":Ljava/util/List;, "Ljava/util/List<Lbutterknife/internal/Parameter;>;"
    invoke-interface {v14}, Lbutterknife/internal/ListenerMethod;->parameters()[Ljava/lang/String;

    move-result-object v12

    .line 283
    .local v12, "listenerParameters":[Ljava/lang/String;
    const/4 v9, 0x0

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v5

    :goto_1e1
    if-ge v9, v5, :cond_222

    .line 284
    move-object/from16 v0, v20

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lbutterknife/internal/Parameter;

    .line 285
    .local v18, "parameter":Lbutterknife/internal/Parameter;
    invoke-virtual/range {v18 .. v18}, Lbutterknife/internal/Parameter;->getListenerPosition()I

    move-result v13

    .line 286
    .local v13, "listenerPosition":I
    aget-object v24, v12, v13

    invoke-virtual/range {v18 .. v18}, Lbutterknife/internal/Parameter;->getType()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-static {v0, v1, v2}, Lbutterknife/internal/ViewInjector;->emitCastIfNeeded(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    const/16 v24, 0x70

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 288
    add-int/lit8 v24, v5, -0x1

    move/from16 v0, v24

    if-ge v9, v0, :cond_21c

    .line 289
    const-string v24, ", "

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    :cond_21c
    add-int/lit8 v9, v9, 0x1

    goto :goto_1e1

    .line 269
    .end local v3    # "binding":Lbutterknife/internal/ListenerBinding;
    .end local v8    # "hasReturnType":Z
    .end local v10    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lbutterknife/internal/ListenerBinding;>;"
    .end local v12    # "listenerParameters":[Ljava/lang/String;
    .end local v13    # "listenerPosition":I
    .end local v18    # "parameter":Lbutterknife/internal/Parameter;
    .end local v20    # "parameters":Ljava/util/List;, "Ljava/util/List<Lbutterknife/internal/Parameter;>;"
    .end local v21    # "set":Ljava/util/Set;, "Ljava/util/Set<Lbutterknife/internal/ListenerBinding;>;"
    :cond_21f
    const/4 v8, 0x0

    goto/16 :goto_196

    .line 292
    .restart local v3    # "binding":Lbutterknife/internal/ListenerBinding;
    .restart local v8    # "hasReturnType":Z
    .restart local v10    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lbutterknife/internal/ListenerBinding;>;"
    .restart local v12    # "listenerParameters":[Ljava/lang/String;
    .restart local v20    # "parameters":Ljava/util/List;, "Ljava/util/List<Lbutterknife/internal/Parameter;>;"
    .restart local v21    # "set":Ljava/util/Set;, "Ljava/util/Set<Lbutterknife/internal/ListenerBinding;>;"
    :cond_222
    const-string v24, ");"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_1b1

    .line 294
    const-string v24, "\n"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "          "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1b1

    .line 297
    .end local v3    # "binding":Lbutterknife/internal/ListenerBinding;
    .end local v10    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lbutterknife/internal/ListenerBinding;>;"
    .end local v12    # "listenerParameters":[Ljava/lang/String;
    .end local v20    # "parameters":Ljava/util/List;, "Ljava/util/List<Lbutterknife/internal/Parameter;>;"
    .end local v21    # "set":Ljava/util/Set;, "Ljava/util/Set<Lbutterknife/internal/ListenerBinding;>;"
    :cond_242
    if-eqz v8, :cond_255

    .line 298
    invoke-interface {v14}, Lbutterknife/internal/ListenerMethod;->defaultReturn()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const/16 v25, 0x3b

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 300
    :cond_255
    const/16 v24, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 303
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "        }\n"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_fe

    .line 307
    .end local v5    # "count":I
    .end local v8    # "hasReturnType":Z
    .end local v9    # "i":I
    .end local v14    # "method":Lbutterknife/internal/ListenerMethod;
    .end local v19    # "parameterTypes":[Ljava/lang/String;
    :cond_26b
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "      });\n"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2a

    .line 310
    .end local v6    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lbutterknife/internal/ListenerClass;Ljava/util/Map<Lbutterknife/internal/ListenerMethod;Ljava/util/Set<Lbutterknife/internal/ListenerBinding;>;>;>;"
    .end local v11    # "listener":Lbutterknife/internal/ListenerClass;
    .end local v15    # "methodBindings":Ljava/util/Map;, "Ljava/util/Map<Lbutterknife/internal/ListenerMethod;Ljava/util/Set<Lbutterknife/internal/ListenerBinding;>;>;"
    .end local v16    # "needsCast":Z
    :cond_278
    if-eqz v17, :cond_a

    .line 311
    const-string v22, "    }\n"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_a
.end method

.method private emitReset(Ljava/lang/StringBuilder;)V
    .registers 9
    .param p1, "builder"    # Ljava/lang/StringBuilder;

    .prologue
    .line 340
    const-string v3, "  public static void reset("

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lbutterknife/internal/ViewInjector;->targetClass:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " target) {\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    iget-object v3, p0, Lbutterknife/internal/ViewInjector;->parentInjector:Ljava/lang/String;

    if-eqz v3, :cond_26

    .line 342
    const-string v3, "    "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lbutterknife/internal/ViewInjector;->parentInjector:Ljava/lang/String;

    .line 343
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".reset(target);\n\n"

    .line 344
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    :cond_26
    iget-object v3, p0, Lbutterknife/internal/ViewInjector;->viewIdMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_30
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_64

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbutterknife/internal/ViewInjection;

    .line 347
    .local v1, "injection":Lbutterknife/internal/ViewInjection;
    invoke-virtual {v1}, Lbutterknife/internal/ViewInjection;->getViewBindings()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_44
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_30

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbutterknife/internal/ViewBinding;

    .line 348
    .local v2, "viewBinding":Lbutterknife/internal/ViewBinding;
    const-string v5, "    target."

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Lbutterknife/internal/ViewBinding;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " = null;\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_44

    .line 351
    .end local v1    # "injection":Lbutterknife/internal/ViewInjection;
    .end local v2    # "viewBinding":Lbutterknife/internal/ViewBinding;
    :cond_64
    iget-object v3, p0, Lbutterknife/internal/ViewInjector;->collectionBindings:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_6e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbutterknife/internal/CollectionBinding;

    .line 352
    .local v0, "collectionBinding":Lbutterknife/internal/CollectionBinding;
    const-string v4, "    target."

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lbutterknife/internal/CollectionBinding;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " = null;\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6e

    .line 354
    .end local v0    # "collectionBinding":Lbutterknife/internal/CollectionBinding;
    :cond_8e
    const-string v3, "  }\n"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    return-void
.end method

.method private emitViewBindings(Ljava/lang/StringBuilder;Lbutterknife/internal/ViewInjection;)V
    .registers 8
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "injection"    # Lbutterknife/internal/ViewInjection;

    .prologue
    .line 174
    invoke-virtual {p2}, Lbutterknife/internal/ViewInjection;->getViewBindings()Ljava/util/Collection;

    move-result-object v1

    .line 175
    .local v1, "viewBindings":Ljava/util/Collection;, "Ljava/util/Collection<Lbutterknife/internal/ViewBinding;>;"
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 186
    :cond_a
    return-void

    .line 179
    :cond_b
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbutterknife/internal/ViewBinding;

    .line 180
    .local v0, "viewBinding":Lbutterknife/internal/ViewBinding;
    const-string v3, "    target."

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 181
    invoke-virtual {v0}, Lbutterknife/internal/ViewBinding;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " = "

    .line 182
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    invoke-virtual {v0}, Lbutterknife/internal/ViewBinding;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lbutterknife/internal/ViewInjector;->emitCastIfNeeded(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 184
    const-string v3, "view;\n"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_f
.end method

.method private emitViewInjection(Ljava/lang/StringBuilder;Lbutterknife/internal/ViewInjection;)V
    .registers 6
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "injection"    # Lbutterknife/internal/ViewInjection;

    .prologue
    .line 150
    const-string v1, "    view = "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    invoke-virtual {p2}, Lbutterknife/internal/ViewInjection;->getRequiredBindings()Ljava/util/List;

    move-result-object v0

    .line 153
    .local v0, "requiredBindings":Ljava/util/List;, "Ljava/util/List<Lbutterknife/internal/Binding;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 154
    const-string v1, "finder.findOptionalView(source, "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 155
    invoke-virtual {p2}, Lbutterknife/internal/ViewInjection;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");\n"

    .line 156
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    :goto_22
    invoke-direct {p0, p1, p2}, Lbutterknife/internal/ViewInjector;->emitViewBindings(Ljava/lang/StringBuilder;Lbutterknife/internal/ViewInjection;)V

    .line 170
    invoke-direct {p0, p1, p2}, Lbutterknife/internal/ViewInjector;->emitListenerBindings(Ljava/lang/StringBuilder;Lbutterknife/internal/ViewInjection;)V

    .line 171
    return-void

    .line 158
    :cond_29
    invoke-virtual {p2}, Lbutterknife/internal/ViewInjection;->getId()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_36

    .line 159
    const-string v1, "target;\n"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 161
    :cond_36
    const-string v1, "finder.findRequiredView(source, "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 162
    invoke-virtual {p2}, Lbutterknife/internal/ViewInjection;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", \""

    .line 163
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    invoke-static {p1, v0}, Lbutterknife/internal/ViewInjector;->emitHumanDescription(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 165
    const-string v1, "\");\n"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_22
.end method

.method static getListenerMethods(Lbutterknife/internal/ListenerClass;)Ljava/util/List;
    .registers 12
    .param p0, "listener"    # Lbutterknife/internal/ListenerClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbutterknife/internal/ListenerClass;",
            ")",
            "Ljava/util/List",
            "<",
            "Lbutterknife/internal/ListenerMethod;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 316
    invoke-interface {p0}, Lbutterknife/internal/ListenerClass;->method()[Lbutterknife/internal/ListenerMethod;

    move-result-object v6

    array-length v6, v6

    if-ne v6, v8, :cond_12

    .line 317
    invoke-interface {p0}, Lbutterknife/internal/ListenerClass;->method()[Lbutterknife/internal/ListenerMethod;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 333
    :cond_11
    return-object v5

    .line 321
    :cond_12
    :try_start_12
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 322
    .local v5, "methods":Ljava/util/List;, "Ljava/util/List<Lbutterknife/internal/ListenerMethod;>;"
    invoke-interface {p0}, Lbutterknife/internal/ListenerClass;->callbacks()Ljava/lang/Class;

    move-result-object v2

    .line 323
    .local v2, "callbacks":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Enum<*>;>;"
    invoke-virtual {v2}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Enum;

    array-length v8, v6

    :goto_22
    if-ge v7, v8, :cond_11

    aget-object v1, v6, v7

    .line 324
    .local v1, "callbackMethod":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 325
    .local v0, "callbackField":Ljava/lang/reflect/Field;
    const-class v9, Lbutterknife/internal/ListenerMethod;

    invoke-virtual {v0, v9}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lbutterknife/internal/ListenerMethod;

    .line 326
    .local v4, "method":Lbutterknife/internal/ListenerMethod;
    if-nez v4, :cond_70

    .line 327
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "@%s\'s %s.%s missing @%s annotation."

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    .line 328
    invoke-virtual {v2}, Ljava/lang/Class;->getEnclosingClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    .line 329
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    const-class v10, Lbutterknife/internal/ListenerMethod;

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    .line 327
    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_69
    .catch Ljava/lang/NoSuchFieldException; {:try_start_12 .. :try_end_69} :catch_69

    .line 334
    .end local v0    # "callbackField":Ljava/lang/reflect/Field;
    .end local v1    # "callbackMethod":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    .end local v2    # "callbacks":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Enum<*>;>;"
    .end local v4    # "method":Lbutterknife/internal/ListenerMethod;
    .end local v5    # "methods":Ljava/util/List;, "Ljava/util/List<Lbutterknife/internal/ListenerMethod;>;"
    :catch_69
    move-exception v3

    .line 335
    .local v3, "e":Ljava/lang/NoSuchFieldException;
    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6

    .line 331
    .end local v3    # "e":Ljava/lang/NoSuchFieldException;
    .restart local v0    # "callbackField":Ljava/lang/reflect/Field;
    .restart local v1    # "callbackMethod":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    .restart local v2    # "callbacks":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Enum<*>;>;"
    .restart local v4    # "method":Lbutterknife/internal/ListenerMethod;
    .restart local v5    # "methods":Ljava/util/List;, "Ljava/util/List<Lbutterknife/internal/ListenerMethod;>;"
    :cond_70
    :try_start_70
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_73
    .catch Ljava/lang/NoSuchFieldException; {:try_start_70 .. :try_end_73} :catch_69

    .line 323
    add-int/lit8 v7, v7, 0x1

    goto :goto_22
.end method

.method private getOrCreateViewInjection(I)Lbutterknife/internal/ViewInjection;
    .registers 5
    .param p1, "id"    # I

    .prologue
    .line 59
    iget-object v1, p0, Lbutterknife/internal/ViewInjector;->viewIdMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbutterknife/internal/ViewInjection;

    .line 60
    .local v0, "viewId":Lbutterknife/internal/ViewInjection;
    if-nez v0, :cond_1c

    .line 61
    new-instance v0, Lbutterknife/internal/ViewInjection;

    .end local v0    # "viewId":Lbutterknife/internal/ViewInjection;
    invoke-direct {v0, p1}, Lbutterknife/internal/ViewInjection;-><init>(I)V

    .line 62
    .restart local v0    # "viewId":Lbutterknife/internal/ViewInjection;
    iget-object v1, p0, Lbutterknife/internal/ViewInjector;->viewIdMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    :cond_1c
    return-object v0
.end method


# virtual methods
.method addCollection([ILbutterknife/internal/CollectionBinding;)V
    .registers 4
    .param p1, "ids"    # [I
    .param p2, "binding"    # Lbutterknife/internal/CollectionBinding;

    .prologue
    .line 47
    iget-object v0, p0, Lbutterknife/internal/ViewInjector;->collectionBindings:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    return-void
.end method

.method addListener(ILbutterknife/internal/ListenerClass;Lbutterknife/internal/ListenerMethod;Lbutterknife/internal/ListenerBinding;)Z
    .registers 8
    .param p1, "id"    # I
    .param p2, "listener"    # Lbutterknife/internal/ListenerClass;
    .param p3, "method"    # Lbutterknife/internal/ListenerMethod;
    .param p4, "binding"    # Lbutterknife/internal/ListenerBinding;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lbutterknife/internal/ViewInjector;->getOrCreateViewInjection(I)Lbutterknife/internal/ViewInjection;

    move-result-object v0

    .line 38
    .local v0, "viewInjection":Lbutterknife/internal/ViewInjection;
    invoke-virtual {v0, p2, p3}, Lbutterknife/internal/ViewInjection;->hasListenerBinding(Lbutterknife/internal/ListenerClass;Lbutterknife/internal/ListenerMethod;)Z

    move-result v1

    if-eqz v1, :cond_18

    const-string v1, "void"

    .line 39
    invoke-interface {p3}, Lbutterknife/internal/ListenerMethod;->returnType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 40
    const/4 v1, 0x0

    .line 43
    :goto_17
    return v1

    .line 42
    :cond_18
    invoke-virtual {v0, p2, p3, p4}, Lbutterknife/internal/ViewInjection;->addListenerBinding(Lbutterknife/internal/ListenerClass;Lbutterknife/internal/ListenerMethod;Lbutterknife/internal/ListenerBinding;)V

    .line 43
    const/4 v1, 0x1

    goto :goto_17
.end method

.method addView(ILbutterknife/internal/ViewBinding;)V
    .registers 4
    .param p1, "id"    # I
    .param p2, "binding"    # Lbutterknife/internal/ViewBinding;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lbutterknife/internal/ViewInjector;->getOrCreateViewInjection(I)Lbutterknife/internal/ViewInjection;

    move-result-object v0

    invoke-virtual {v0, p2}, Lbutterknife/internal/ViewInjection;->addViewBinding(Lbutterknife/internal/ViewBinding;)V

    .line 33
    return-void
.end method

.method brewJava()Ljava/lang/String;
    .registers 4

    .prologue
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "// Generated code from Butter Knife. Do not modify!\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    const-string v1, "package "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lbutterknife/internal/ViewInjector;->classPackage:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    const-string v1, "import android.view.View;\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    const-string v1, "import butterknife.ButterKnife.Finder;\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    const-string v1, "public class "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lbutterknife/internal/ViewInjector;->className:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " {\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    invoke-direct {p0, v0}, Lbutterknife/internal/ViewInjector;->emitInject(Ljava/lang/StringBuilder;)V

    .line 79
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    invoke-direct {p0, v0}, Lbutterknife/internal/ViewInjector;->emitReset(Ljava/lang/StringBuilder;)V

    .line 81
    const-string v1, "}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getFqcn()Ljava/lang/String;
    .registers 3

    .prologue
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lbutterknife/internal/ViewInjector;->classPackage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lbutterknife/internal/ViewInjector;->className:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getViewInjection(I)Lbutterknife/internal/ViewInjection;
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 55
    iget-object v0, p0, Lbutterknife/internal/ViewInjector;->viewIdMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbutterknife/internal/ViewInjection;

    return-object v0
.end method

.method setParentInjector(Ljava/lang/String;)V
    .registers 2
    .param p1, "parentInjector"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lbutterknife/internal/ViewInjector;->parentInjector:Ljava/lang/String;

    .line 52
    return-void
.end method
