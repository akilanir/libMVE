.class public final Lbutterknife/internal/ButterKnifeProcessor;
.super Ljavax/annotation/processing/AbstractProcessor;
.source "ButterKnifeProcessor.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final ANDROID_PREFIX:Ljava/lang/String; = "android."

.field public static final JAVA_PREFIX:Ljava/lang/String; = "java."

.field private static final LISTENERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final LIST_TYPE:Ljava/lang/String;

.field public static final SUFFIX:Ljava/lang/String; = "$$ViewInjector"

.field static final VIEW_TYPE:Ljava/lang/String; = "android.view.View"


# instance fields
.field private elementUtils:Ljavax/lang/model/util/Elements;

.field private filer:Ljavax/annotation/processing/Filer;

.field private typeUtils:Ljavax/lang/model/util/Types;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 58
    const-class v0, Lbutterknife/internal/ButterKnifeProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_58

    move v0, v1

    :goto_b
    sput-boolean v0, Lbutterknife/internal/ButterKnifeProcessor;->$assertionsDisabled:Z

    .line 63
    const-class v0, Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lbutterknife/internal/ButterKnifeProcessor;->LIST_TYPE:Ljava/lang/String;

    .line 64
    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/Class;

    const-class v3, Lbutterknife/OnCheckedChanged;

    aput-object v3, v0, v2

    const-class v2, Lbutterknife/OnClick;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Lbutterknife/OnEditorAction;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Lbutterknife/OnFocusChange;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Lbutterknife/OnItemClick;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lbutterknife/OnItemLongClick;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-class v2, Lbutterknife/OnItemSelected;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-class v2, Lbutterknife/OnLongClick;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-class v2, Lbutterknife/OnPageChange;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-class v2, Lbutterknife/OnTextChanged;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-class v2, Lbutterknife/OnTouch;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lbutterknife/internal/ButterKnifeProcessor;->LISTENERS:Ljava/util/List;

    return-void

    :cond_58
    move v0, v2

    .line 58
    goto :goto_b
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Ljavax/annotation/processing/AbstractProcessor;-><init>()V

    return-void
.end method

.method private doubleErasure(Ljavax/lang/model/type/TypeMirror;)Ljava/lang/String;
    .registers 5
    .param p1, "elementType"    # Ljavax/lang/model/type/TypeMirror;

    .prologue
    .line 372
    iget-object v2, p0, Lbutterknife/internal/ButterKnifeProcessor;->typeUtils:Ljavax/lang/model/util/Types;

    invoke-interface {v2, p1}, Ljavax/lang/model/util/Types;->erasure(Ljavax/lang/model/type/TypeMirror;)Ljavax/lang/model/type/TypeMirror;

    move-result-object v2

    invoke-interface {v2}, Ljavax/lang/model/type/TypeMirror;->toString()Ljava/lang/String;

    move-result-object v0

    .line 373
    .local v0, "name":Ljava/lang/String;
    const/16 v2, 0x3c

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 374
    .local v1, "typeParamStart":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_18

    .line 375
    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 377
    :cond_18
    return-object v0
.end method

.method private varargs error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "element"    # Ljavax/lang/model/element/Element;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 672
    array-length v0, p3

    if-lez v0, :cond_7

    .line 673
    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 675
    :cond_7
    iget-object v0, p0, Lbutterknife/internal/ButterKnifeProcessor;->processingEnv:Ljavax/annotation/processing/ProcessingEnvironment;

    invoke-interface {v0}, Ljavax/annotation/processing/ProcessingEnvironment;->getMessager()Ljavax/annotation/processing/Messager;

    move-result-object v0

    sget-object v1, Ljavax/tools/Diagnostic$Kind;->ERROR:Ljavax/tools/Diagnostic$Kind;

    invoke-interface {v0, v1, p2, p1}, Ljavax/annotation/processing/Messager;->printMessage(Ljavax/tools/Diagnostic$Kind;Ljava/lang/CharSequence;Ljavax/lang/model/element/Element;)V

    .line 676
    return-void
.end method

.method private findAndParseListener(Ljavax/annotation/processing/RoundEnvironment;Ljava/lang/Class;Ljava/util/Map;Ljava/util/Set;)V
    .registers 13
    .param p1, "env"    # Ljavax/annotation/processing/RoundEnvironment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/annotation/processing/RoundEnvironment;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 383
    .local p2, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    .local p3, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .local p4, "erasedTargetNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p1, p2}, Ljavax/annotation/processing/RoundEnvironment;->getElementsAnnotatedWith(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/lang/model/element/Element;

    .line 385
    .local v1, "element":Ljavax/lang/model/element/Element;
    :try_start_14
    invoke-direct {p0, p2, v1, p3, p4}, Lbutterknife/internal/ButterKnifeProcessor;->parseListenerAnnotation(Ljava/lang/Class;Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_17} :catch_18

    goto :goto_8

    .line 386
    :catch_18
    move-exception v0

    .line 387
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 388
    .local v2, "stackTrace":Ljava/io/StringWriter;
    new-instance v4, Ljava/io/PrintWriter;

    invoke-direct {v4, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v0, v4}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 390
    const-string v4, "Unable to generate view injector for @%s.\n\n%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 391
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    .line 390
    invoke-direct {p0, v1, v4, v5}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_8

    .line 394
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "element":Ljavax/lang/model/element/Element;
    .end local v2    # "stackTrace":Ljava/io/StringWriter;
    :cond_3d
    return-void
.end method

.method private findAndParseTargets(Ljavax/annotation/processing/RoundEnvironment;)Ljava/util/Map;
    .registers 15
    .param p1, "env"    # Ljavax/annotation/processing/RoundEnvironment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/annotation/processing/RoundEnvironment;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 123
    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7}, Ljava/util/LinkedHashMap;-><init>()V

    .line 124
    .local v7, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 127
    .local v3, "erasedTargetNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-class v8, Lbutterknife/InjectView;

    invoke-interface {p1, v8}, Ljavax/annotation/processing/RoundEnvironment;->getElementsAnnotatedWith(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_16
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3e

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/lang/model/element/Element;

    .line 129
    .local v1, "element":Ljavax/lang/model/element/Element;
    :try_start_22
    invoke-direct {p0, v1, v7, v3}, Lbutterknife/internal/ButterKnifeProcessor;->parseInjectView(Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_25} :catch_26

    goto :goto_16

    .line 130
    :catch_26
    move-exception v0

    .line 131
    .local v0, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/io/StringWriter;

    invoke-direct {v6}, Ljava/io/StringWriter;-><init>()V

    .line 132
    .local v6, "stackTrace":Ljava/io/StringWriter;
    new-instance v9, Ljava/io/PrintWriter;

    invoke-direct {v9, v6}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v0, v9}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 134
    const-string v9, "Unable to generate view injector for @InjectView.\n\n%s"

    new-array v10, v12, [Ljava/lang/Object;

    aput-object v6, v10, v11

    invoke-direct {p0, v1, v9, v10}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_16

    .line 139
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "element":Ljavax/lang/model/element/Element;
    .end local v6    # "stackTrace":Ljava/io/StringWriter;
    :cond_3e
    const-class v8, Lbutterknife/InjectViews;

    invoke-interface {p1, v8}, Ljavax/annotation/processing/RoundEnvironment;->getElementsAnnotatedWith(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_48
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_70

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/lang/model/element/Element;

    .line 141
    .restart local v1    # "element":Ljavax/lang/model/element/Element;
    :try_start_54
    invoke-direct {p0, v1, v7, v3}, Lbutterknife/internal/ButterKnifeProcessor;->parseInjectViews(Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_57} :catch_58

    goto :goto_48

    .line 142
    :catch_58
    move-exception v0

    .line 143
    .restart local v0    # "e":Ljava/lang/Exception;
    new-instance v6, Ljava/io/StringWriter;

    invoke-direct {v6}, Ljava/io/StringWriter;-><init>()V

    .line 144
    .restart local v6    # "stackTrace":Ljava/io/StringWriter;
    new-instance v9, Ljava/io/PrintWriter;

    invoke-direct {v9, v6}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v0, v9}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 146
    const-string v9, "Unable to generate view injector for @InjectViews.\n\n%s"

    new-array v10, v12, [Ljava/lang/Object;

    aput-object v6, v10, v11

    invoke-direct {p0, v1, v9, v10}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_48

    .line 151
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "element":Ljavax/lang/model/element/Element;
    .end local v6    # "stackTrace":Ljava/io/StringWriter;
    :cond_70
    sget-object v8, Lbutterknife/internal/ButterKnifeProcessor;->LISTENERS:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_76
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_86

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 152
    .local v4, "listener":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    invoke-direct {p0, p1, v4, v7, v3}, Lbutterknife/internal/ButterKnifeProcessor;->findAndParseListener(Ljavax/annotation/processing/RoundEnvironment;Ljava/lang/Class;Ljava/util/Map;Ljava/util/Set;)V

    goto :goto_76

    .line 156
    .end local v4    # "listener":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    :cond_86
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_8e
    :goto_8e
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_c3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 157
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljavax/lang/model/element/TypeElement;

    invoke-direct {p0, v8, v3}, Lbutterknife/internal/ButterKnifeProcessor;->findParentFqcn(Ljavax/lang/model/element/TypeElement;Ljava/util/Set;)Ljava/lang/String;

    move-result-object v5

    .line 158
    .local v5, "parentClassFqcn":Ljava/lang/String;
    if-eqz v5, :cond_8e

    .line 159
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lbutterknife/internal/ViewInjector;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "$$ViewInjector"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lbutterknife/internal/ViewInjector;->setParentInjector(Ljava/lang/String;)V

    goto :goto_8e

    .line 163
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .end local v5    # "parentClassFqcn":Ljava/lang/String;
    :cond_c3
    return-object v7
.end method

.method private static findDuplicate([I)Ljava/lang/Integer;
    .registers 6
    .param p0, "array"    # [I

    .prologue
    .line 359
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 361
    .local v1, "seenElements":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    array-length v3, p0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v3, :cond_1d

    aget v0, p0, v2

    .line 362
    .local v0, "element":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1a

    .line 363
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 367
    .end local v0    # "element":I
    :goto_19
    return-object v2

    .line 361
    .restart local v0    # "element":I
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 367
    .end local v0    # "element":I
    :cond_1d
    const/4 v2, 0x0

    goto :goto_19
.end method

.method private findParentFqcn(Ljavax/lang/model/element/TypeElement;Ljava/util/Set;)Ljava/lang/String;
    .registers 7
    .param p1, "typeElement"    # Ljavax/lang/model/element/TypeElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/lang/model/element/TypeElement;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 655
    .local p2, "parents":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_0
    invoke-interface {p1}, Ljavax/lang/model/element/TypeElement;->getSuperclass()Ljavax/lang/model/type/TypeMirror;

    move-result-object v1

    .line 656
    .local v1, "type":Ljavax/lang/model/type/TypeMirror;
    invoke-interface {v1}, Ljavax/lang/model/type/TypeMirror;->getKind()Ljavax/lang/model/type/TypeKind;

    move-result-object v2

    sget-object v3, Ljavax/lang/model/type/TypeKind;->NONE:Ljavax/lang/model/type/TypeKind;

    if-ne v2, v3, :cond_e

    .line 657
    const/4 v2, 0x0

    .line 662
    .end local v1    # "type":Ljavax/lang/model/type/TypeMirror;
    :goto_d
    return-object v2

    .line 659
    .restart local v1    # "type":Ljavax/lang/model/type/TypeMirror;
    :cond_e
    check-cast v1, Ljavax/lang/model/type/DeclaredType;

    .end local v1    # "type":Ljavax/lang/model/type/TypeMirror;
    invoke-interface {v1}, Ljavax/lang/model/type/DeclaredType;->asElement()Ljavax/lang/model/element/Element;

    move-result-object p1

    .end local p1    # "typeElement":Ljavax/lang/model/element/TypeElement;
    check-cast p1, Ljavax/lang/model/element/TypeElement;

    .line 660
    .restart local p1    # "typeElement":Ljavax/lang/model/element/TypeElement;
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 661
    invoke-direct {p0, p1}, Lbutterknife/internal/ButterKnifeProcessor;->getPackageName(Ljavax/lang/model/element/TypeElement;)Ljava/lang/String;

    move-result-object v0

    .line 662
    .local v0, "packageName":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1, v0}, Lbutterknife/internal/ButterKnifeProcessor;->getClassName(Ljavax/lang/model/element/TypeElement;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method private static getClassName(Ljavax/lang/model/element/TypeElement;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "type"    # Ljavax/lang/model/element/TypeElement;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 647
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 648
    .local v0, "packageLen":I
    invoke-interface {p0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    const/16 v3, 0x24

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getOrCreateTargetClass(Ljava/util/Map;Ljavax/lang/model/element/TypeElement;)Lbutterknife/internal/ViewInjector;
    .registers 9
    .param p2, "enclosingElement"    # Ljavax/lang/model/element/TypeElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;",
            "Ljavax/lang/model/element/TypeElement;",
            ")",
            "Lbutterknife/internal/ViewInjector;"
        }
    .end annotation

    .prologue
    .line 634
    .local p1, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbutterknife/internal/ViewInjector;

    .line 635
    .local v3, "viewInjector":Lbutterknife/internal/ViewInjector;
    if-nez v3, :cond_33

    .line 636
    invoke-interface {p2}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 637
    .local v2, "targetType":Ljava/lang/String;
    invoke-direct {p0, p2}, Lbutterknife/internal/ButterKnifeProcessor;->getPackageName(Ljavax/lang/model/element/TypeElement;)Ljava/lang/String;

    move-result-object v1

    .line 638
    .local v1, "classPackage":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p2, v1}, Lbutterknife/internal/ButterKnifeProcessor;->getClassName(Ljavax/lang/model/element/TypeElement;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "$$ViewInjector"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 640
    .local v0, "className":Ljava/lang/String;
    new-instance v3, Lbutterknife/internal/ViewInjector;

    .end local v3    # "viewInjector":Lbutterknife/internal/ViewInjector;
    invoke-direct {v3, v1, v0, v2}, Lbutterknife/internal/ViewInjector;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    .restart local v3    # "viewInjector":Lbutterknife/internal/ViewInjector;
    invoke-interface {p1, p2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 643
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "classPackage":Ljava/lang/String;
    .end local v2    # "targetType":Ljava/lang/String;
    :cond_33
    return-object v3
.end method

.method private getPackageName(Ljavax/lang/model/element/TypeElement;)Ljava/lang/String;
    .registers 3
    .param p1, "type"    # Ljavax/lang/model/element/TypeElement;

    .prologue
    .line 679
    iget-object v0, p0, Lbutterknife/internal/ButterKnifeProcessor;->elementUtils:Ljavax/lang/model/util/Elements;

    invoke-interface {v0, p1}, Ljavax/lang/model/util/Elements;->getPackageOf(Ljavax/lang/model/element/Element;)Ljavax/lang/model/element/PackageElement;

    move-result-object v0

    invoke-interface {v0}, Ljavax/lang/model/element/PackageElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isBindingInWrongPackage(Ljava/lang/Class;Ljavax/lang/model/element/Element;)Z
    .registers 10
    .param p2, "element"    # Ljavax/lang/model/element/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljavax/lang/model/element/Element;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    const/4 v5, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 201
    invoke-interface {p2}, Ljavax/lang/model/element/Element;->getEnclosingElement()Ljavax/lang/model/element/Element;

    move-result-object v0

    check-cast v0, Ljavax/lang/model/element/TypeElement;

    .line 202
    .local v0, "enclosingElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 204
    .local v1, "qualifiedName":Ljava/lang/String;
    const-string v4, "android."

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 205
    const-string v4, "@%s-annotated class incorrectly in Android framework package. (%s)"

    new-array v5, v5, [Ljava/lang/Object;

    .line 206
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object v1, v5, v2

    .line 205
    invoke-direct {p0, p2, v4, v5}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 215
    :goto_28
    return v2

    .line 209
    :cond_29
    const-string v4, "java."

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_41

    .line 210
    const-string v4, "@%s-annotated class incorrectly in Java framework package. (%s)"

    new-array v5, v5, [Ljava/lang/Object;

    .line 211
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object v1, v5, v2

    .line 210
    invoke-direct {p0, p2, v4, v5}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_28

    :cond_41
    move v2, v3

    .line 215
    goto :goto_28
.end method

.method private isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z
    .registers 15
    .param p1, "typeMirror"    # Ljavax/lang/model/type/TypeMirror;
    .param p2, "otherType"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 593
    invoke-interface {p1}, Ljavax/lang/model/type/TypeMirror;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_d

    .line 629
    :cond_c
    :goto_c
    return v8

    .line 596
    :cond_d
    instance-of v10, p1, Ljavax/lang/model/type/DeclaredType;

    if-nez v10, :cond_13

    move v8, v9

    .line 597
    goto :goto_c

    :cond_13
    move-object v0, p1

    .line 599
    check-cast v0, Ljavax/lang/model/type/DeclaredType;

    .line 600
    .local v0, "declaredType":Ljavax/lang/model/type/DeclaredType;
    invoke-interface {v0}, Ljavax/lang/model/type/DeclaredType;->getTypeArguments()Ljava/util/List;

    move-result-object v5

    .line 601
    .local v5, "typeArguments":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/type/TypeMirror;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-lez v10, :cond_57

    .line 602
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljavax/lang/model/type/DeclaredType;->asElement()Ljavax/lang/model/element/Element;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 603
    .local v7, "typeString":Ljava/lang/StringBuilder;
    const/16 v10, 0x3c

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 604
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_33
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-ge v2, v10, :cond_48

    .line 605
    if-lez v2, :cond_40

    .line 606
    const/16 v10, 0x2c

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 608
    :cond_40
    const/16 v10, 0x3f

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 604
    add-int/lit8 v2, v2, 0x1

    goto :goto_33

    .line 610
    :cond_48
    const/16 v10, 0x3e

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 611
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_c

    .line 615
    .end local v2    # "i":I
    .end local v7    # "typeString":Ljava/lang/StringBuilder;
    :cond_57
    invoke-interface {v0}, Ljavax/lang/model/type/DeclaredType;->asElement()Ljavax/lang/model/element/Element;

    move-result-object v1

    .line 616
    .local v1, "element":Ljavax/lang/model/element/Element;
    instance-of v10, v1, Ljavax/lang/model/element/TypeElement;

    if-nez v10, :cond_61

    move v8, v9

    .line 617
    goto :goto_c

    :cond_61
    move-object v6, v1

    .line 619
    check-cast v6, Ljavax/lang/model/element/TypeElement;

    .line 620
    .local v6, "typeElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface {v6}, Ljavax/lang/model/element/TypeElement;->getSuperclass()Ljavax/lang/model/type/TypeMirror;

    move-result-object v4

    .line 621
    .local v4, "superType":Ljavax/lang/model/type/TypeMirror;
    invoke-direct {p0, v4, p2}, Lbutterknife/internal/ButterKnifeProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_c

    .line 624
    invoke-interface {v6}, Ljavax/lang/model/element/TypeElement;->getInterfaces()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_76
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_89

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavax/lang/model/type/TypeMirror;

    .line 625
    .local v3, "interfaceType":Ljavax/lang/model/type/TypeMirror;
    invoke-direct {p0, v3, p2}, Lbutterknife/internal/ButterKnifeProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_76

    goto :goto_c

    .end local v3    # "interfaceType":Ljavax/lang/model/type/TypeMirror;
    :cond_89
    move v8, v9

    .line 629
    goto :goto_c
.end method

.method private isValidForGeneratedCode(Ljava/lang/Class;Ljava/lang/String;Ljavax/lang/model/element/Element;)Z
    .registers 15
    .param p2, "targetThing"    # Ljava/lang/String;
    .param p3, "element"    # Ljavax/lang/model/element/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/lang/String;",
            "Ljavax/lang/model/element/Element;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 168
    const/4 v1, 0x0

    .line 169
    .local v1, "hasError":Z
    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getEnclosingElement()Ljavax/lang/model/element/Element;

    move-result-object v0

    check-cast v0, Ljavax/lang/model/element/TypeElement;

    .line 172
    .local v0, "enclosingElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getModifiers()Ljava/util/Set;

    move-result-object v2

    .line 173
    .local v2, "modifiers":Ljava/util/Set;, "Ljava/util/Set<Ljavax/lang/model/element/Modifier;>;"
    sget-object v3, Ljavax/lang/model/element/Modifier;->PRIVATE:Ljavax/lang/model/element/Modifier;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_20

    sget-object v3, Ljavax/lang/model/element/Modifier;->STATIC:Ljavax/lang/model/element/Modifier;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 174
    :cond_20
    const-string v3, "@%s %s must not be private or static. (%s.%s)"

    new-array v4, v10, [Ljava/lang/Object;

    .line 175
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    aput-object p2, v4, v7

    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v8

    .line 176
    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v9

    .line 174
    invoke-direct {p0, p3, v3, v4}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 177
    const/4 v1, 0x1

    .line 181
    :cond_3c
    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getKind()Ljavax/lang/model/element/ElementKind;

    move-result-object v3

    sget-object v4, Ljavax/lang/model/element/ElementKind;->CLASS:Ljavax/lang/model/element/ElementKind;

    if-eq v3, v4, :cond_60

    .line 182
    const-string v3, "@%s %s may only be contained in classes. (%s.%s)"

    new-array v4, v10, [Ljava/lang/Object;

    .line 183
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    aput-object p2, v4, v7

    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v8

    .line 184
    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v9

    .line 182
    invoke-direct {p0, v0, v3, v4}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 185
    const/4 v1, 0x1

    .line 189
    :cond_60
    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getModifiers()Ljava/util/Set;

    move-result-object v3

    sget-object v4, Ljavax/lang/model/element/Modifier;->PRIVATE:Ljavax/lang/model/element/Modifier;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_88

    .line 190
    const-string v3, "@%s %s may not be contained in private classes. (%s.%s)"

    new-array v4, v10, [Ljava/lang/Object;

    .line 191
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    aput-object p2, v4, v7

    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v8

    .line 192
    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v9

    .line 190
    invoke-direct {p0, v0, v3, v4}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 193
    const/4 v1, 0x1

    .line 196
    :cond_88
    return v1
.end method

.method private parseInjectView(Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    .registers 26
    .param p1, "element"    # Ljavax/lang/model/element/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/lang/model/element/Element;",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 220
    .local p2, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .local p3, "erasedTargetNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v8, 0x0

    .line 221
    .local v8, "hasError":Z
    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getEnclosingElement()Ljavax/lang/model/element/Element;

    move-result-object v6

    check-cast v6, Ljavax/lang/model/element/TypeElement;

    .line 224
    .local v6, "enclosingElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v5

    .line 225
    .local v5, "elementType":Ljavax/lang/model/type/TypeMirror;
    instance-of v0, v5, Ljavax/lang/model/type/TypeVariable;

    move/from16 v18, v0

    if-eqz v18, :cond_18

    move-object v15, v5

    .line 226
    check-cast v15, Ljavax/lang/model/type/TypeVariable;

    .line 227
    .local v15, "typeVariable":Ljavax/lang/model/type/TypeVariable;
    invoke-interface {v15}, Ljavax/lang/model/type/TypeVariable;->getUpperBound()Ljavax/lang/model/type/TypeMirror;

    move-result-object v5

    .line 229
    .end local v15    # "typeVariable":Ljavax/lang/model/type/TypeVariable;
    :cond_18
    const-string v18, "android.view.View"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v5, v1}, Lbutterknife/internal/ButterKnifeProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_4a

    .line 230
    const-string v18, "@InjectView fields must extend from View. (%s.%s)"

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    .line 231
    invoke-interface {v6}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x1

    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v21

    aput-object v21, v19, v20

    .line 230
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 232
    const/4 v8, 0x1

    .line 236
    :cond_4a
    const-class v18, Lbutterknife/InjectView;

    const-string v19, "fields"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->isValidForGeneratedCode(Ljava/lang/Class;Ljava/lang/String;Ljavax/lang/model/element/Element;)Z

    move-result v18

    or-int v8, v8, v18

    .line 237
    const-class v18, Lbutterknife/InjectView;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lbutterknife/internal/ButterKnifeProcessor;->isBindingInWrongPackage(Ljava/lang/Class;Ljavax/lang/model/element/Element;)Z

    move-result v18

    or-int v8, v8, v18

    .line 240
    const-class v18, Lbutterknife/InjectViews;

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v18

    if-eqz v18, :cond_9c

    .line 241
    const-string v18, "Only one of @InjectView and @InjectViews is allowed. (%s.%s)"

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    .line 242
    invoke-interface {v6}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x1

    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v21

    aput-object v21, v19, v20

    .line 241
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 243
    const/4 v8, 0x1

    .line 246
    :cond_9c
    if-eqz v8, :cond_9f

    .line 279
    :goto_9e
    return-void

    .line 251
    :cond_9f
    const-class v18, Lbutterknife/InjectView;

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v18

    check-cast v18, Lbutterknife/InjectView;

    invoke-interface/range {v18 .. v18}, Lbutterknife/InjectView;->value()I

    move-result v9

    .line 253
    .local v9, "id":I
    move-object/from16 v0, p2

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lbutterknife/internal/ViewInjector;

    .line 254
    .local v10, "injector":Lbutterknife/internal/ViewInjector;
    if-eqz v10, :cond_109

    .line 255
    invoke-virtual {v10, v9}, Lbutterknife/internal/ViewInjector;->getViewInjection(I)Lbutterknife/internal/ViewInjection;

    move-result-object v16

    .line 256
    .local v16, "viewInjection":Lbutterknife/internal/ViewInjection;
    if-eqz v16, :cond_109

    .line 257
    invoke-virtual/range {v16 .. v16}, Lbutterknife/internal/ViewInjection;->getViewBindings()Ljava/util/Collection;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 258
    .local v11, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lbutterknife/internal/ViewBinding;>;"
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_109

    .line 259
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lbutterknife/internal/ViewBinding;

    .line 260
    .local v7, "existingBinding":Lbutterknife/internal/ViewBinding;
    const-string v18, "Attempt to use @InjectView for an already injected ID %d on \'%s\'. (%s.%s)"

    const/16 v19, 0x4

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    .line 261
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x1

    .line 262
    invoke-virtual {v7}, Lbutterknife/internal/ViewBinding;->getName()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x2

    invoke-interface {v6}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x3

    .line 263
    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v21

    aput-object v21, v19, v20

    .line 260
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_9e

    .line 269
    .end local v7    # "existingBinding":Lbutterknife/internal/ViewBinding;
    .end local v11    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lbutterknife/internal/ViewBinding;>;"
    .end local v16    # "viewInjection":Lbutterknife/internal/ViewInjection;
    :cond_109
    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    .line 270
    .local v12, "name":Ljava/lang/String;
    invoke-interface {v5}, Ljavax/lang/model/type/TypeMirror;->toString()Ljava/lang/String;

    move-result-object v14

    .line 271
    .local v14, "type":Ljava/lang/String;
    const-class v18, Lbutterknife/Optional;

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v18

    if-nez v18, :cond_141

    const/4 v13, 0x1

    .line 273
    .local v13, "required":Z
    :goto_122
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v6}, Lbutterknife/internal/ButterKnifeProcessor;->getOrCreateTargetClass(Ljava/util/Map;Ljavax/lang/model/element/TypeElement;)Lbutterknife/internal/ViewInjector;

    move-result-object v17

    .line 274
    .local v17, "viewInjector":Lbutterknife/internal/ViewInjector;
    new-instance v4, Lbutterknife/internal/ViewBinding;

    invoke-direct {v4, v12, v14, v13}, Lbutterknife/internal/ViewBinding;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 275
    .local v4, "binding":Lbutterknife/internal/ViewBinding;
    move-object/from16 v0, v17

    invoke-virtual {v0, v9, v4}, Lbutterknife/internal/ViewInjector;->addView(ILbutterknife/internal/ViewBinding;)V

    .line 278
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_9e

    .line 271
    .end local v4    # "binding":Lbutterknife/internal/ViewBinding;
    .end local v13    # "required":Z
    .end local v17    # "viewInjector":Lbutterknife/internal/ViewInjector;
    :cond_141
    const/4 v13, 0x0

    goto :goto_122
.end method

.method private parseInjectViews(Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    .registers 29
    .param p1, "element"    # Ljavax/lang/model/element/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/lang/model/element/Element;",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 283
    .local p2, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .local p3, "erasedTargetNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v11, 0x0

    .line 284
    .local v11, "hasError":Z
    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getEnclosingElement()Ljavax/lang/model/element/Element;

    move-result-object v9

    check-cast v9, Ljavax/lang/model/element/TypeElement;

    .line 287
    .local v9, "enclosingElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v8

    .line 288
    .local v8, "elementType":Ljavax/lang/model/type/TypeMirror;
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lbutterknife/internal/ButterKnifeProcessor;->doubleErasure(Ljavax/lang/model/type/TypeMirror;)Ljava/lang/String;

    move-result-object v10

    .line 289
    .local v10, "erasedType":Ljava/lang/String;
    const/16 v20, 0x0

    .line 290
    .local v20, "viewType":Ljavax/lang/model/type/TypeMirror;
    const/4 v13, 0x0

    .line 291
    .local v13, "kind":Lbutterknife/internal/CollectionBinding$Kind;
    invoke-interface {v8}, Ljavax/lang/model/type/TypeMirror;->getKind()Ljavax/lang/model/type/TypeKind;

    move-result-object v21

    sget-object v22, Ljavax/lang/model/type/TypeKind;->ARRAY:Ljavax/lang/model/type/TypeKind;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    if-ne v0, v1, :cond_92

    move-object v4, v8

    .line 292
    check-cast v4, Ljavax/lang/model/type/ArrayType;

    .line 293
    .local v4, "arrayType":Ljavax/lang/model/type/ArrayType;
    invoke-interface {v4}, Ljavax/lang/model/type/ArrayType;->getComponentType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v20

    .line 294
    sget-object v13, Lbutterknife/internal/CollectionBinding$Kind;->ARRAY:Lbutterknife/internal/CollectionBinding$Kind;

    .line 311
    .end local v4    # "arrayType":Ljavax/lang/model/type/ArrayType;
    :goto_29
    move-object/from16 v0, v20

    instance-of v0, v0, Ljavax/lang/model/type/TypeVariable;

    move/from16 v21, v0

    if-eqz v21, :cond_39

    move-object/from16 v18, v20

    .line 312
    check-cast v18, Ljavax/lang/model/type/TypeVariable;

    .line 313
    .local v18, "typeVariable":Ljavax/lang/model/type/TypeVariable;
    invoke-interface/range {v18 .. v18}, Ljavax/lang/model/type/TypeVariable;->getUpperBound()Ljavax/lang/model/type/TypeMirror;

    move-result-object v20

    .line 317
    .end local v18    # "typeVariable":Ljavax/lang/model/type/TypeVariable;
    :cond_39
    if-eqz v20, :cond_6f

    const-string v21, "android.view.View"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lbutterknife/internal/ButterKnifeProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_6f

    .line 318
    const-string v21, "@InjectViews type must extend from View. (%s.%s)"

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    .line 319
    invoke-interface {v9}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    .line 318
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 320
    const/4 v11, 0x1

    .line 324
    :cond_6f
    const-class v21, Lbutterknife/InjectViews;

    const-string v22, "fields"

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->isValidForGeneratedCode(Ljava/lang/Class;Ljava/lang/String;Ljavax/lang/model/element/Element;)Z

    move-result v21

    or-int v11, v11, v21

    .line 325
    const-class v21, Lbutterknife/InjectViews;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lbutterknife/internal/ButterKnifeProcessor;->isBindingInWrongPackage(Ljava/lang/Class;Ljavax/lang/model/element/Element;)Z

    move-result v21

    or-int v11, v11, v21

    .line 327
    if-eqz v11, :cond_10e

    .line 355
    :goto_91
    return-void

    .line 295
    :cond_92
    sget-object v21, Lbutterknife/internal/ButterKnifeProcessor;->LIST_TYPE:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_e6

    move-object v6, v8

    .line 296
    check-cast v6, Ljavax/lang/model/type/DeclaredType;

    .line 297
    .local v6, "declaredType":Ljavax/lang/model/type/DeclaredType;
    invoke-interface {v6}, Ljavax/lang/model/type/DeclaredType;->getTypeArguments()Ljava/util/List;

    move-result-object v17

    .line 298
    .local v17, "typeArguments":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/type/TypeMirror;>;"
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v21

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_d9

    .line 299
    const-string v21, "@InjectViews List must have a generic component. (%s.%s)"

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    .line 300
    invoke-interface {v9}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    .line 299
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 301
    const/4 v11, 0x1

    .line 305
    :goto_d5
    sget-object v13, Lbutterknife/internal/CollectionBinding$Kind;->LIST:Lbutterknife/internal/CollectionBinding$Kind;

    .line 306
    goto/16 :goto_29

    .line 303
    :cond_d9
    const/16 v21, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    .end local v20    # "viewType":Ljavax/lang/model/type/TypeMirror;
    check-cast v20, Ljavax/lang/model/type/TypeMirror;

    .restart local v20    # "viewType":Ljavax/lang/model/type/TypeMirror;
    goto :goto_d5

    .line 307
    .end local v6    # "declaredType":Ljavax/lang/model/type/DeclaredType;
    .end local v17    # "typeArguments":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/type/TypeMirror;>;"
    :cond_e6
    const-string v21, "@InjectViews must be a List or array. (%s.%s)"

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    .line 308
    invoke-interface {v9}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    .line 307
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 309
    const/4 v11, 0x1

    goto/16 :goto_29

    .line 332
    :cond_10e
    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    .line 333
    .local v14, "name":Ljava/lang/String;
    const-class v21, Lbutterknife/InjectViews;

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v21

    check-cast v21, Lbutterknife/InjectViews;

    invoke-interface/range {v21 .. v21}, Lbutterknife/InjectViews;->value()[I

    move-result-object v12

    .line 334
    .local v12, "ids":[I
    array-length v0, v12

    move/from16 v21, v0

    if-nez v21, :cond_152

    .line 335
    const-string v21, "@InjectViews must specify at least one ID. (%s.%s)"

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    .line 336
    invoke-interface {v9}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    .line 335
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_91

    .line 340
    :cond_152
    invoke-static {v12}, Lbutterknife/internal/ButterKnifeProcessor;->findDuplicate([I)Ljava/lang/Integer;

    move-result-object v7

    .line 341
    .local v7, "duplicateId":Ljava/lang/Integer;
    if-eqz v7, :cond_181

    .line 342
    const-string v21, "@InjectViews annotation contains duplicate ID %d. (%s.%s)"

    const/16 v22, 0x3

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object v7, v22, v23

    const/16 v23, 0x1

    .line 343
    invoke-interface {v9}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x2

    invoke-interface/range {p1 .. p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v24

    aput-object v24, v22, v23

    .line 342
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 346
    :cond_181
    sget-boolean v21, Lbutterknife/internal/ButterKnifeProcessor;->$assertionsDisabled:Z

    if-nez v21, :cond_18d

    if-nez v20, :cond_18d

    new-instance v21, Ljava/lang/AssertionError;

    invoke-direct/range {v21 .. v21}, Ljava/lang/AssertionError;-><init>()V

    throw v21

    .line 347
    :cond_18d
    invoke-interface/range {v20 .. v20}, Ljavax/lang/model/type/TypeMirror;->toString()Ljava/lang/String;

    move-result-object v16

    .line 348
    .local v16, "type":Ljava/lang/String;
    const-class v21, Lbutterknife/Optional;

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v21

    if-nez v21, :cond_1bf

    const/4 v15, 0x1

    .line 350
    .local v15, "required":Z
    :goto_19e
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v9}, Lbutterknife/internal/ButterKnifeProcessor;->getOrCreateTargetClass(Ljava/util/Map;Ljavax/lang/model/element/TypeElement;)Lbutterknife/internal/ViewInjector;

    move-result-object v19

    .line 351
    .local v19, "viewInjector":Lbutterknife/internal/ViewInjector;
    new-instance v5, Lbutterknife/internal/CollectionBinding;

    move-object/from16 v0, v16

    invoke-direct {v5, v14, v0, v13, v15}, Lbutterknife/internal/CollectionBinding;-><init>(Ljava/lang/String;Ljava/lang/String;Lbutterknife/internal/CollectionBinding$Kind;Z)V

    .line 352
    .local v5, "binding":Lbutterknife/internal/CollectionBinding;
    move-object/from16 v0, v19

    invoke-virtual {v0, v12, v5}, Lbutterknife/internal/ViewInjector;->addCollection([ILbutterknife/internal/CollectionBinding;)V

    .line 354
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_91

    .line 348
    .end local v5    # "binding":Lbutterknife/internal/CollectionBinding;
    .end local v15    # "required":Z
    .end local v19    # "viewInjector":Lbutterknife/internal/ViewInjector;
    :cond_1bf
    const/4 v15, 0x0

    goto :goto_19e
.end method

.method private parseListenerAnnotation(Ljava/lang/Class;Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    .registers 47
    .param p2, "element"    # Ljavax/lang/model/element/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljavax/lang/model/element/Element;",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 400
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    .local p3, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .local p4, "erasedTargetNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object/from16 v0, p2

    instance-of v0, v0, Ljavax/lang/model/element/ExecutableElement;

    move/from16 v36, v0

    if-eqz v36, :cond_14

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getKind()Ljavax/lang/model/element/ElementKind;

    move-result-object v36

    sget-object v37, Ljavax/lang/model/element/ElementKind;->METHOD:Ljavax/lang/model/element/ElementKind;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    if-eq v0, v1, :cond_30

    .line 401
    :cond_14
    new-instance v36, Ljava/lang/IllegalStateException;

    const-string v37, "@%s annotation must be on a method."

    const/16 v38, 0x1

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    .line 402
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v40

    aput-object v40, v38, v39

    invoke-static/range {v37 .. v38}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v36

    :cond_30
    move-object/from16 v13, p2

    .line 405
    check-cast v13, Ljavax/lang/model/element/ExecutableElement;

    .line 406
    .local v13, "executableElement":Ljavax/lang/model/element/ExecutableElement;
    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getEnclosingElement()Ljavax/lang/model/element/Element;

    move-result-object v12

    check-cast v12, Ljavax/lang/model/element/TypeElement;

    .line 409
    .local v12, "enclosingElement":Ljavax/lang/model/element/TypeElement;
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    .line 410
    .local v4, "annotation":Ljava/lang/annotation/Annotation;
    const-string v36, "value"

    const/16 v37, 0x0

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v37, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 411
    .local v6, "annotationValue":Ljava/lang/reflect/Method;
    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v36

    const-class v37, [I

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    if-eq v0, v1, :cond_7a

    .line 412
    new-instance v36, Ljava/lang/IllegalStateException;

    const-string v37, "@%s annotation value() type not int[]."

    const/16 v38, 0x1

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    aput-object p1, v38, v39

    .line 413
    invoke-static/range {v37 .. v38}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 416
    :cond_7a
    const/16 v36, 0x0

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    invoke-virtual {v6, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    check-cast v36, [I

    move-object/from16 v17, v36

    check-cast v17, [I

    .line 417
    .local v17, "ids":[I
    invoke-interface {v13}, Ljavax/lang/model/element/ExecutableElement;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v26

    .line 418
    .local v26, "name":Ljava/lang/String;
    const-class v36, Lbutterknife/Optional;

    move-object/from16 v0, p2

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v36

    if-nez v36, :cond_124

    const/16 v31, 0x1

    .line 421
    .local v31, "required":Z
    :goto_a4
    const-string v36, "methods"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v36

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->isValidForGeneratedCode(Ljava/lang/Class;Ljava/lang/String;Ljavax/lang/model/element/Element;)Z

    move-result v14

    .line 422
    .local v14, "hasError":Z
    invoke-direct/range {p0 .. p2}, Lbutterknife/internal/ButterKnifeProcessor;->isBindingInWrongPackage(Ljava/lang/Class;Ljavax/lang/model/element/Element;)Z

    move-result v36

    or-int v14, v14, v36

    .line 424
    invoke-static/range {v17 .. v17}, Lbutterknife/internal/ButterKnifeProcessor;->findDuplicate([I)Ljava/lang/Integer;

    move-result-object v11

    .line 425
    .local v11, "duplicateId":Ljava/lang/Integer;
    if-eqz v11, :cond_f0

    .line 426
    const-string v36, "@%s annotation for method contains duplicate ID %d. (%s.%s)"

    const/16 v37, 0x4

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    .line 427
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x1

    aput-object v11, v37, v38

    const/16 v38, 0x2

    invoke-interface {v12}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x3

    .line 428
    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v39

    aput-object v39, v37, v38

    .line 426
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v36

    move-object/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 429
    const/4 v14, 0x1

    .line 432
    :cond_f0
    const-class v36, Lbutterknife/internal/ListenerClass;

    move-object/from16 v0, p1

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v19

    check-cast v19, Lbutterknife/internal/ListenerClass;

    .line 433
    .local v19, "listener":Lbutterknife/internal/ListenerClass;
    if-nez v19, :cond_128

    .line 434
    new-instance v36, Ljava/lang/IllegalStateException;

    const-string v37, "No @%s defined on @%s."

    const/16 v38, 0x2

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    const-class v40, Lbutterknife/internal/ListenerClass;

    .line 435
    invoke-virtual/range {v40 .. v40}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v40

    aput-object v40, v38, v39

    const/16 v39, 0x1

    .line 436
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v40

    aput-object v40, v38, v39

    .line 435
    invoke-static/range {v37 .. v38}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 418
    .end local v11    # "duplicateId":Ljava/lang/Integer;
    .end local v14    # "hasError":Z
    .end local v19    # "listener":Lbutterknife/internal/ListenerClass;
    .end local v31    # "required":Z
    :cond_124
    const/16 v31, 0x0

    goto/16 :goto_a4

    .line 439
    .restart local v11    # "duplicateId":Ljava/lang/Integer;
    .restart local v14    # "hasError":Z
    .restart local v19    # "listener":Lbutterknife/internal/ListenerClass;
    .restart local v31    # "required":Z
    :cond_128
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v37, v0

    const/16 v36, 0x0

    :goto_12f
    move/from16 v0, v36

    move/from16 v1, v37

    if-ge v0, v1, :cond_1f5

    aget v16, v17, v36

    .line 440
    .local v16, "id":I
    const/16 v38, -0x1

    move/from16 v0, v16

    move/from16 v1, v38

    if-ne v0, v1, :cond_1ba

    .line 441
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v38, v0

    const/16 v39, 0x1

    move/from16 v0, v38

    move/from16 v1, v39

    if-ne v0, v1, :cond_1be

    .line 442
    if-nez v31, :cond_174

    .line 443
    const-string v38, "ID free injection must not be annotated with @Optional. (%s.%s)"

    const/16 v39, 0x2

    move/from16 v0, v39

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    .line 444
    invoke-interface {v12}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v41

    aput-object v41, v39, v40

    const/16 v40, 0x1

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v41

    aput-object v41, v39, v40

    .line 443
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v38

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 445
    const/4 v14, 0x1

    .line 449
    :cond_174
    invoke-interface/range {v19 .. v19}, Lbutterknife/internal/ListenerClass;->targetType()Ljava/lang/String;

    move-result-object v33

    .line 450
    .local v33, "targetType":Ljava/lang/String;
    invoke-interface {v12}, Ljavax/lang/model/element/TypeElement;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v38

    move-object/from16 v0, p0

    move-object/from16 v1, v38

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lbutterknife/internal/ButterKnifeProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v38

    if-nez v38, :cond_1ba

    .line 451
    const-string v38, "@%s annotation without an ID may only be used with an object of type \"%s\". (%s.%s)"

    const/16 v39, 0x4

    move/from16 v0, v39

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    .line 452
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v41

    aput-object v41, v39, v40

    const/16 v40, 0x1

    aput-object v33, v39, v40

    const/16 v40, 0x2

    .line 453
    invoke-interface {v12}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v41

    aput-object v41, v39, v40

    const/16 v40, 0x3

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v41

    aput-object v41, v39, v40

    .line 451
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v38

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 454
    const/4 v14, 0x1

    .line 439
    .end local v33    # "targetType":Ljava/lang/String;
    :cond_1ba
    :goto_1ba
    add-int/lit8 v36, v36, 0x1

    goto/16 :goto_12f

    .line 457
    :cond_1be
    const-string v38, "@%s annotation contains invalid ID %d. (%s.%s)"

    const/16 v39, 0x4

    move/from16 v0, v39

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    .line 458
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v41

    aput-object v41, v39, v40

    const/16 v40, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v41

    aput-object v41, v39, v40

    const/16 v40, 0x2

    invoke-interface {v12}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v41

    aput-object v41, v39, v40

    const/16 v40, 0x3

    .line 459
    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v41

    aput-object v41, v39, v40

    .line 457
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v38

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 460
    const/4 v14, 0x1

    goto :goto_1ba

    .line 466
    .end local v16    # "id":I
    :cond_1f5
    invoke-interface/range {v19 .. v19}, Lbutterknife/internal/ListenerClass;->method()[Lbutterknife/internal/ListenerMethod;

    move-result-object v25

    .line 467
    .local v25, "methods":[Lbutterknife/internal/ListenerMethod;
    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v36, v0

    const/16 v37, 0x1

    move/from16 v0, v36

    move/from16 v1, v37

    if-le v0, v1, :cond_222

    .line 468
    new-instance v36, Ljava/lang/IllegalStateException;

    const-string v37, "Multiple listener methods specified on @%s."

    const/16 v38, 0x1

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    .line 469
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v40

    aput-object v40, v38, v39

    .line 468
    invoke-static/range {v37 .. v38}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 470
    :cond_222
    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v36, v0

    const/16 v37, 0x1

    move/from16 v0, v36

    move/from16 v1, v37

    if-ne v0, v1, :cond_30c

    .line 471
    invoke-interface/range {v19 .. v19}, Lbutterknife/internal/ListenerClass;->callbacks()Ljava/lang/Class;

    move-result-object v36

    const-class v37, Lbutterknife/internal/ListenerClass$NONE;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    if-eq v0, v1, :cond_257

    .line 472
    new-instance v36, Ljava/lang/IllegalStateException;

    const-string v37, "Both method() and callback() defined on @%s."

    const/16 v38, 0x1

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    .line 474
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v40

    aput-object v40, v38, v39

    .line 473
    invoke-static/range {v37 .. v38}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 476
    :cond_257
    const/16 v36, 0x0

    aget-object v20, v25, v36

    .line 491
    .local v20, "method":Lbutterknife/internal/ListenerMethod;
    :cond_25b
    invoke-interface {v13}, Ljavax/lang/model/element/ExecutableElement;->getParameters()Ljava/util/List;

    move-result-object v24

    .line 492
    .local v24, "methodParameters":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/element/VariableElement;>;"
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v36

    invoke-interface/range {v20 .. v20}, Lbutterknife/internal/ListenerMethod;->parameters()[Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    array-length v0, v0

    move/from16 v37, v0

    move/from16 v0, v36

    move/from16 v1, v37

    if-le v0, v1, :cond_2b1

    .line 493
    const-string v36, "@%s methods can have at most %s parameter(s). (%s.%s)"

    const/16 v37, 0x4

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    .line 494
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x1

    invoke-interface/range {v20 .. v20}, Lbutterknife/internal/ListenerMethod;->parameters()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    array-length v0, v0

    move/from16 v39, v0

    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x2

    .line 495
    invoke-interface {v12}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x3

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v39

    aput-object v39, v37, v38

    .line 493
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v36

    move-object/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 496
    const/4 v14, 0x1

    .line 500
    :cond_2b1
    invoke-interface {v13}, Ljavax/lang/model/element/ExecutableElement;->getReturnType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v32

    .line 501
    .local v32, "returnType":Ljavax/lang/model/type/TypeMirror;
    move-object/from16 v0, v32

    instance-of v0, v0, Ljavax/lang/model/type/TypeVariable;

    move/from16 v36, v0

    if-eqz v36, :cond_2c5

    move-object/from16 v34, v32

    .line 502
    check-cast v34, Ljavax/lang/model/type/TypeVariable;

    .line 503
    .local v34, "typeVariable":Ljavax/lang/model/type/TypeVariable;
    invoke-interface/range {v34 .. v34}, Ljavax/lang/model/type/TypeVariable;->getUpperBound()Ljavax/lang/model/type/TypeMirror;

    move-result-object v32

    .line 505
    .end local v34    # "typeVariable":Ljavax/lang/model/type/TypeVariable;
    :cond_2c5
    invoke-interface/range {v32 .. v32}, Ljavax/lang/model/type/TypeMirror;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-interface/range {v20 .. v20}, Lbutterknife/internal/ListenerMethod;->returnType()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-nez v36, :cond_309

    .line 506
    const-string v36, "@%s methods must have a \'%s\' return type. (%s.%s)"

    const/16 v37, 0x4

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    .line 507
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x1

    invoke-interface/range {v20 .. v20}, Lbutterknife/internal/ListenerMethod;->returnType()Ljava/lang/String;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x2

    .line 508
    invoke-interface {v12}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x3

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v39

    aput-object v39, v37, v38

    .line 506
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v36

    move-object/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 509
    const/4 v14, 0x1

    .line 512
    :cond_309
    if-eqz v14, :cond_382

    .line 590
    :goto_30b
    return-void

    .line 478
    .end local v20    # "method":Lbutterknife/internal/ListenerMethod;
    .end local v24    # "methodParameters":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/element/VariableElement;>;"
    .end local v32    # "returnType":Ljavax/lang/model/type/TypeMirror;
    :cond_30c
    const-string v36, "callback"

    const/16 v37, 0x0

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v37, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 479
    .local v5, "annotationCallback":Ljava/lang/reflect/Method;
    const/16 v36, 0x0

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    invoke-virtual {v5, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Enum;

    .line 480
    .local v9, "callback":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    invoke-virtual {v9}, Ljava/lang/Enum;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v36

    invoke-virtual {v9}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 481
    .local v10, "callbackField":Ljava/lang/reflect/Field;
    const-class v36, Lbutterknife/internal/ListenerMethod;

    move-object/from16 v0, v36

    invoke-virtual {v10, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v20

    check-cast v20, Lbutterknife/internal/ListenerMethod;

    .line 482
    .restart local v20    # "method":Lbutterknife/internal/ListenerMethod;
    if-nez v20, :cond_25b

    .line 483
    new-instance v36, Ljava/lang/IllegalStateException;

    const-string v37, "No @%s defined on @%s\'s %s.%s."

    const/16 v38, 0x4

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    const-class v40, Lbutterknife/internal/ListenerMethod;

    .line 484
    invoke-virtual/range {v40 .. v40}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v40

    aput-object v40, v38, v39

    const/16 v39, 0x1

    .line 485
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v40

    aput-object v40, v38, v39

    const/16 v39, 0x2

    invoke-virtual {v9}, Ljava/lang/Enum;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v40

    aput-object v40, v38, v39

    const/16 v39, 0x3

    .line 486
    invoke-virtual {v9}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v40

    aput-object v40, v38, v39

    .line 484
    invoke-static/range {v37 .. v38}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 516
    .end local v5    # "annotationCallback":Ljava/lang/reflect/Method;
    .end local v9    # "callback":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    .end local v10    # "callbackField":Ljava/lang/reflect/Field;
    .restart local v24    # "methodParameters":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/element/VariableElement;>;"
    .restart local v32    # "returnType":Ljavax/lang/model/type/TypeMirror;
    :cond_382
    sget-object v30, Lbutterknife/internal/Parameter;->NONE:[Lbutterknife/internal/Parameter;

    .line 517
    .local v30, "parameters":[Lbutterknife/internal/Parameter;
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->isEmpty()Z

    move-result v36

    if-nez v36, :cond_513

    .line 518
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v36

    move/from16 v0, v36

    new-array v0, v0, [Lbutterknife/internal/Parameter;

    move-object/from16 v30, v0

    .line 519
    new-instance v23, Ljava/util/BitSet;

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v36

    move-object/from16 v0, v23

    move/from16 v1, v36

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 520
    .local v23, "methodParameterUsed":Ljava/util/BitSet;
    invoke-interface/range {v20 .. v20}, Lbutterknife/internal/ListenerMethod;->parameters()[Ljava/lang/String;

    move-result-object v29

    .line 521
    .local v29, "parameterTypes":[Ljava/lang/String;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_3a6
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v36

    move/from16 v0, v36

    if-ge v15, v0, :cond_513

    .line 522
    move-object/from16 v0, v24

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljavax/lang/model/element/VariableElement;

    .line 523
    .local v21, "methodParameter":Ljavax/lang/model/element/VariableElement;
    invoke-interface/range {v21 .. v21}, Ljavax/lang/model/element/VariableElement;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v22

    .line 524
    .local v22, "methodParameterType":Ljavax/lang/model/type/TypeMirror;
    move-object/from16 v0, v22

    instance-of v0, v0, Ljavax/lang/model/type/TypeVariable;

    move/from16 v36, v0

    if-eqz v36, :cond_3ca

    move-object/from16 v34, v22

    .line 525
    check-cast v34, Ljavax/lang/model/type/TypeVariable;

    .line 526
    .restart local v34    # "typeVariable":Ljavax/lang/model/type/TypeVariable;
    invoke-interface/range {v34 .. v34}, Ljavax/lang/model/type/TypeVariable;->getUpperBound()Ljavax/lang/model/type/TypeMirror;

    move-result-object v22

    .line 529
    .end local v34    # "typeVariable":Ljavax/lang/model/type/TypeVariable;
    :cond_3ca
    const/16 v18, 0x0

    .local v18, "j":I
    :goto_3cc
    move-object/from16 v0, v29

    array-length v0, v0

    move/from16 v36, v0

    move/from16 v0, v18

    move/from16 v1, v36

    if-ge v0, v1, :cond_40a

    .line 530
    move-object/from16 v0, v23

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v36

    if-eqz v36, :cond_3e4

    .line 529
    :cond_3e1
    add-int/lit8 v18, v18, 0x1

    goto :goto_3cc

    .line 533
    :cond_3e4
    aget-object v36, v29, v18

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lbutterknife/internal/ButterKnifeProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v36

    if-eqz v36, :cond_3e1

    .line 534
    new-instance v36, Lbutterknife/internal/Parameter;

    invoke-interface/range {v22 .. v22}, Ljavax/lang/model/type/TypeMirror;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v36

    move/from16 v1, v18

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lbutterknife/internal/Parameter;-><init>(ILjava/lang/String;)V

    aput-object v36, v30, v15

    .line 535
    move-object/from16 v0, v23

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    .line 539
    :cond_40a
    aget-object v36, v30, v15

    if-nez v36, :cond_50f

    .line 540
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 541
    .local v8, "builder":Ljava/lang/StringBuilder;
    const-string v36, "Unable to match @"

    move-object/from16 v0, v36

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    .line 542
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " method arguments. ("

    .line 543
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    .line 544
    invoke-interface {v12}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x2e

    .line 545
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    .line 546
    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x29

    .line 547
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 548
    const/16 v18, 0x0

    :goto_446
    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v36, v0

    move/from16 v0, v18

    move/from16 v1, v36

    if-ge v0, v1, :cond_4b2

    .line 549
    aget-object v27, v30, v18

    .line 550
    .local v27, "parameter":Lbutterknife/internal/Parameter;
    const-string v36, "\n\n  Parameter #"

    move-object/from16 v0, v36

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    add-int/lit8 v37, v18, 0x1

    .line 551
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ": "

    .line 552
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    .line 553
    move-object/from16 v0, v24

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v36

    check-cast v36, Ljavax/lang/model/element/VariableElement;

    invoke-interface/range {v36 .. v36}, Ljavax/lang/model/element/VariableElement;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v36

    invoke-interface/range {v36 .. v36}, Ljavax/lang/model/type/TypeMirror;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v37

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, "\n    "

    .line 554
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    if-nez v27, :cond_492

    .line 556
    const-string v36, "did not match any listener parameters"

    move-object/from16 v0, v36

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 548
    :goto_48f
    add-int/lit8 v18, v18, 0x1

    goto :goto_446

    .line 558
    :cond_492
    const-string v36, "matched listener parameter #"

    move-object/from16 v0, v36

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    .line 559
    invoke-virtual/range {v27 .. v27}, Lbutterknife/internal/Parameter;->getListenerPosition()I

    move-result v37

    add-int/lit8 v37, v37, 0x1

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ": "

    .line 560
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    .line 561
    invoke-virtual/range {v27 .. v27}, Lbutterknife/internal/Parameter;->getType()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_48f

    .line 564
    .end local v27    # "parameter":Lbutterknife/internal/Parameter;
    :cond_4b2
    const-string v36, "\n\nMethods may have up to "

    move-object/from16 v0, v36

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    .line 565
    invoke-interface/range {v20 .. v20}, Lbutterknife/internal/ListenerMethod;->parameters()[Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    array-length v0, v0

    move/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " parameter(s):\n"

    .line 566
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    invoke-interface/range {v20 .. v20}, Lbutterknife/internal/ListenerMethod;->parameters()[Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    array-length v0, v0

    move/from16 v38, v0

    const/16 v36, 0x0

    :goto_4d7
    move/from16 v0, v36

    move/from16 v1, v38

    if-ge v0, v1, :cond_4f1

    aget-object v28, v37, v36

    .line 568
    .local v28, "parameterType":Ljava/lang/String;
    const-string v39, "\n  "

    move-object/from16 v0, v39

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    add-int/lit8 v36, v36, 0x1

    goto :goto_4d7

    .line 570
    .end local v28    # "parameterType":Ljava/lang/String;
    :cond_4f1
    const-string v36, "\n\nThese may be listed in any order but will be searched for from top to bottom."

    move-object/from16 v0, v36

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 572
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    const/16 v37, 0x0

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-direct {v0, v13, v1, v2}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_30b

    .line 521
    .end local v8    # "builder":Ljava/lang/StringBuilder;
    :cond_50f
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_3a6

    .line 578
    .end local v15    # "i":I
    .end local v18    # "j":I
    .end local v21    # "methodParameter":Ljavax/lang/model/element/VariableElement;
    .end local v22    # "methodParameterType":Ljavax/lang/model/type/TypeMirror;
    .end local v23    # "methodParameterUsed":Ljava/util/BitSet;
    .end local v29    # "parameterTypes":[Ljava/lang/String;
    :cond_513
    new-instance v7, Lbutterknife/internal/ListenerBinding;

    invoke-static/range {v30 .. v30}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    move-object/from16 v0, v26

    move-object/from16 v1, v36

    move/from16 v2, v31

    invoke-direct {v7, v0, v1, v2}, Lbutterknife/internal/ListenerBinding;-><init>(Ljava/lang/String;Ljava/util/List;Z)V

    .line 579
    .local v7, "binding":Lbutterknife/internal/ListenerBinding;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v12}, Lbutterknife/internal/ButterKnifeProcessor;->getOrCreateTargetClass(Ljava/util/Map;Ljavax/lang/model/element/TypeElement;)Lbutterknife/internal/ViewInjector;

    move-result-object v35

    .line 580
    .local v35, "viewInjector":Lbutterknife/internal/ViewInjector;
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v37, v0

    const/16 v36, 0x0

    :goto_531
    move/from16 v0, v36

    move/from16 v1, v37

    if-ge v0, v1, :cond_579

    aget v16, v17, v36

    .line 581
    .restart local v16    # "id":I
    move-object/from16 v0, v35

    move/from16 v1, v16

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3, v7}, Lbutterknife/internal/ViewInjector;->addListener(ILbutterknife/internal/ListenerClass;Lbutterknife/internal/ListenerMethod;Lbutterknife/internal/ListenerBinding;)Z

    move-result v38

    if-nez v38, :cond_576

    .line 582
    const-string v36, "Multiple listener methods with return value specified for ID %d. (%s.%s)"

    const/16 v37, 0x3

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    .line 583
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x1

    invoke-interface {v12}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x2

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v39

    aput-object v39, v37, v38

    .line 582
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v36

    move-object/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_30b

    .line 580
    :cond_576
    add-int/lit8 v36, v36, 0x1

    goto :goto_531

    .line 589
    .end local v16    # "id":I
    :cond_579
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p4

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_30b
.end method


# virtual methods
.method public getSupportedAnnotationTypes()Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 92
    .local v1, "supportTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-class v2, Lbutterknife/InjectView;

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 93
    const-class v2, Lbutterknife/InjectViews;

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 94
    sget-object v2, Lbutterknife/internal/ButterKnifeProcessor;->LISTENERS:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_31

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 95
    .local v0, "listener":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 98
    .end local v0    # "listener":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    :cond_31
    return-object v1
.end method

.method public getSupportedSourceVersion()Ljavax/lang/model/SourceVersion;
    .registers 2

    .prologue
    .line 668
    invoke-static {}, Ljavax/lang/model/SourceVersion;->latestSupported()Ljavax/lang/model/SourceVersion;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized init(Ljavax/annotation/processing/ProcessingEnvironment;)V
    .registers 3
    .param p1, "env"    # Ljavax/annotation/processing/ProcessingEnvironment;

    .prologue
    .line 83
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1}, Ljavax/annotation/processing/AbstractProcessor;->init(Ljavax/annotation/processing/ProcessingEnvironment;)V

    .line 85
    invoke-interface {p1}, Ljavax/annotation/processing/ProcessingEnvironment;->getElementUtils()Ljavax/lang/model/util/Elements;

    move-result-object v0

    iput-object v0, p0, Lbutterknife/internal/ButterKnifeProcessor;->elementUtils:Ljavax/lang/model/util/Elements;

    .line 86
    invoke-interface {p1}, Ljavax/annotation/processing/ProcessingEnvironment;->getTypeUtils()Ljavax/lang/model/util/Types;

    move-result-object v0

    iput-object v0, p0, Lbutterknife/internal/ButterKnifeProcessor;->typeUtils:Ljavax/lang/model/util/Types;

    .line 87
    invoke-interface {p1}, Ljavax/annotation/processing/ProcessingEnvironment;->getFiler()Ljavax/annotation/processing/Filer;

    move-result-object v0

    iput-object v0, p0, Lbutterknife/internal/ButterKnifeProcessor;->filer:Ljavax/annotation/processing/Filer;
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_18

    .line 88
    monitor-exit p0

    return-void

    .line 83
    :catchall_18
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public process(Ljava/util/Set;Ljavax/annotation/processing/RoundEnvironment;)Z
    .registers 15
    .param p2, "env"    # Ljavax/annotation/processing/RoundEnvironment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<+",
            "Ljavax/lang/model/element/TypeElement;",
            ">;",
            "Ljavax/annotation/processing/RoundEnvironment;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 102
    .local p1, "elements":Ljava/util/Set;, "Ljava/util/Set<+Ljavax/lang/model/element/TypeElement;>;"
    invoke-direct {p0, p2}, Lbutterknife/internal/ButterKnifeProcessor;->findAndParseTargets(Ljavax/annotation/processing/RoundEnvironment;)Ljava/util/Map;

    move-result-object v3

    .line 104
    .local v3, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5a

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 105
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavax/lang/model/element/TypeElement;

    .line 106
    .local v4, "typeElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lbutterknife/internal/ViewInjector;

    .line 109
    .local v5, "viewInjector":Lbutterknife/internal/ViewInjector;
    :try_start_24
    iget-object v8, p0, Lbutterknife/internal/ButterKnifeProcessor;->filer:Ljavax/annotation/processing/Filer;

    invoke-virtual {v5}, Lbutterknife/internal/ViewInjector;->getFqcn()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    new-array v10, v10, [Ljavax/lang/model/element/Element;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    invoke-interface {v8, v9, v10}, Ljavax/annotation/processing/Filer;->createSourceFile(Ljava/lang/CharSequence;[Ljavax/lang/model/element/Element;)Ljavax/tools/JavaFileObject;

    move-result-object v2

    .line 110
    .local v2, "jfo":Ljavax/tools/JavaFileObject;
    invoke-interface {v2}, Ljavax/tools/JavaFileObject;->openWriter()Ljava/io/Writer;

    move-result-object v6

    .line 111
    .local v6, "writer":Ljava/io/Writer;
    invoke-virtual {v5}, Lbutterknife/internal/ViewInjector;->brewJava()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 112
    invoke-virtual {v6}, Ljava/io/Writer;->flush()V

    .line 113
    invoke-virtual {v6}, Ljava/io/Writer;->close()V
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_45} :catch_46

    goto :goto_c

    .line 114
    .end local v2    # "jfo":Ljavax/tools/JavaFileObject;
    .end local v6    # "writer":Ljava/io/Writer;
    :catch_46
    move-exception v0

    .line 115
    .local v0, "e":Ljava/io/IOException;
    const-string v8, "Unable to write injector for type %s: %s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    const/4 v10, 0x1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-direct {p0, v4, v8, v9}, Lbutterknife/internal/ButterKnifeProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_c

    .line 119
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .end local v4    # "typeElement":Ljavax/lang/model/element/TypeElement;
    .end local v5    # "viewInjector":Lbutterknife/internal/ViewInjector;
    :cond_5a
    const/4 v7, 0x1

    return v7
.end method
