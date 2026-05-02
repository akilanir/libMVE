.class Lch/qos/logback/core/pattern/parser/Compiler;
.super Lch/qos/logback/core/spi/ContextAwareBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/spi/ContextAwareBase;"
    }
.end annotation


# instance fields
.field final converterMap:Ljava/util/Map;

.field head:Lch/qos/logback/core/pattern/Converter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;"
        }
    .end annotation
.end field

.field tail:Lch/qos/logback/core/pattern/Converter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;"
        }
    .end annotation
.end field

.field final top:Lch/qos/logback/core/pattern/parser/Node;


# direct methods
.method constructor <init>(Lch/qos/logback/core/pattern/parser/Node;Ljava/util/Map;)V
    .registers 3

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/pattern/parser/Compiler;->top:Lch/qos/logback/core/pattern/parser/Node;

    iput-object p2, p0, Lch/qos/logback/core/pattern/parser/Compiler;->converterMap:Ljava/util/Map;

    return-void
.end method

.method private addToList(Lch/qos/logback/core/pattern/Converter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Compiler;->head:Lch/qos/logback/core/pattern/Converter;

    if-nez v0, :cond_9

    iput-object p1, p0, Lch/qos/logback/core/pattern/parser/Compiler;->tail:Lch/qos/logback/core/pattern/Converter;

    iput-object p1, p0, Lch/qos/logback/core/pattern/parser/Compiler;->head:Lch/qos/logback/core/pattern/Converter;

    :goto_8
    return-void

    :cond_9
    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Compiler;->tail:Lch/qos/logback/core/pattern/Converter;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/pattern/Converter;->setNext(Lch/qos/logback/core/pattern/Converter;)V

    iput-object p1, p0, Lch/qos/logback/core/pattern/parser/Compiler;->tail:Lch/qos/logback/core/pattern/Converter;

    goto :goto_8
.end method


# virtual methods
.method compile()Lch/qos/logback/core/pattern/Converter;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;"
        }
    .end annotation

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/Compiler;->tail:Lch/qos/logback/core/pattern/Converter;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/Compiler;->head:Lch/qos/logback/core/pattern/Converter;

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/Compiler;->top:Lch/qos/logback/core/pattern/parser/Node;

    :goto_7
    if-eqz v1, :cond_101

    iget v0, v1, Lch/qos/logback/core/pattern/parser/Node;->type:I

    packed-switch v0, :pswitch_data_104

    :goto_e
    iget-object v1, v1, Lch/qos/logback/core/pattern/parser/Node;->next:Lch/qos/logback/core/pattern/parser/Node;

    goto :goto_7

    :pswitch_11
    new-instance v2, Lch/qos/logback/core/pattern/LiteralConverter;

    invoke-virtual {v1}, Lch/qos/logback/core/pattern/parser/Node;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v2, v0}, Lch/qos/logback/core/pattern/LiteralConverter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v2}, Lch/qos/logback/core/pattern/parser/Compiler;->addToList(Lch/qos/logback/core/pattern/Converter;)V

    goto :goto_e

    :pswitch_20
    move-object v0, v1

    check-cast v0, Lch/qos/logback/core/pattern/parser/CompositeNode;

    invoke-virtual {p0, v0}, Lch/qos/logback/core/pattern/parser/Compiler;->createCompositeConverter(Lch/qos/logback/core/pattern/parser/CompositeNode;)Lch/qos/logback/core/pattern/CompositeConverter;

    move-result-object v2

    if-nez v2, :cond_6f

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to create converter for [%"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/parser/CompositeNode;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] keyword"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lch/qos/logback/core/pattern/parser/Compiler;->addError(Ljava/lang/String;)V

    new-instance v2, Lch/qos/logback/core/pattern/LiteralConverter;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "%PARSER_ERROR["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/parser/CompositeNode;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "]"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lch/qos/logback/core/pattern/LiteralConverter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v2}, Lch/qos/logback/core/pattern/parser/Compiler;->addToList(Lch/qos/logback/core/pattern/Converter;)V

    goto :goto_e

    :cond_6f
    invoke-virtual {v0}, Lch/qos/logback/core/pattern/parser/CompositeNode;->getFormatInfo()Lch/qos/logback/core/pattern/FormatInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Lch/qos/logback/core/pattern/CompositeConverter;->setFormattingInfo(Lch/qos/logback/core/pattern/FormatInfo;)V

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/parser/CompositeNode;->getOptions()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lch/qos/logback/core/pattern/CompositeConverter;->setOptionList(Ljava/util/List;)V

    new-instance v3, Lch/qos/logback/core/pattern/parser/Compiler;

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/parser/CompositeNode;->getChildNode()Lch/qos/logback/core/pattern/parser/Node;

    move-result-object v0

    iget-object v4, p0, Lch/qos/logback/core/pattern/parser/Compiler;->converterMap:Ljava/util/Map;

    invoke-direct {v3, v0, v4}, Lch/qos/logback/core/pattern/parser/Compiler;-><init>(Lch/qos/logback/core/pattern/parser/Node;Ljava/util/Map;)V

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Compiler;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v3, v0}, Lch/qos/logback/core/pattern/parser/Compiler;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {v3}, Lch/qos/logback/core/pattern/parser/Compiler;->compile()Lch/qos/logback/core/pattern/Converter;

    move-result-object v0

    invoke-virtual {v2, v0}, Lch/qos/logback/core/pattern/CompositeConverter;->setChildConverter(Lch/qos/logback/core/pattern/Converter;)V

    invoke-direct {p0, v2}, Lch/qos/logback/core/pattern/parser/Compiler;->addToList(Lch/qos/logback/core/pattern/Converter;)V

    goto/16 :goto_e

    :pswitch_99
    move-object v0, v1

    check-cast v0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;

    invoke-virtual {p0, v0}, Lch/qos/logback/core/pattern/parser/Compiler;->createConverter(Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;)Lch/qos/logback/core/pattern/DynamicConverter;

    move-result-object v2

    if-eqz v2, :cond_b5

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->getFormatInfo()Lch/qos/logback/core/pattern/FormatInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Lch/qos/logback/core/pattern/DynamicConverter;->setFormattingInfo(Lch/qos/logback/core/pattern/FormatInfo;)V

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->getOptions()Ljava/util/List;

    move-result-object v0

    invoke-virtual {v2, v0}, Lch/qos/logback/core/pattern/DynamicConverter;->setOptionList(Ljava/util/List;)V

    invoke-direct {p0, v2}, Lch/qos/logback/core/pattern/parser/Compiler;->addToList(Lch/qos/logback/core/pattern/Converter;)V

    goto/16 :goto_e

    :cond_b5
    new-instance v2, Lch/qos/logback/core/pattern/LiteralConverter;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "%PARSER_ERROR["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lch/qos/logback/core/pattern/LiteralConverter;-><init>(Ljava/lang/String;)V

    new-instance v3, Lch/qos/logback/core/status/ErrorStatus;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "] is not a valid conversion word"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0, p0}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v3}, Lch/qos/logback/core/pattern/parser/Compiler;->addStatus(Lch/qos/logback/core/status/Status;)V

    invoke-direct {p0, v2}, Lch/qos/logback/core/pattern/parser/Compiler;->addToList(Lch/qos/logback/core/pattern/Converter;)V

    goto/16 :goto_e

    :cond_101
    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Compiler;->head:Lch/qos/logback/core/pattern/Converter;

    return-object v0

    :pswitch_data_104
    .packed-switch 0x0
        :pswitch_11
        :pswitch_99
        :pswitch_20
    .end packed-switch
.end method

.method createCompositeConverter(Lch/qos/logback/core/pattern/parser/CompositeNode;)Lch/qos/logback/core/pattern/CompositeConverter;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/pattern/parser/CompositeNode;",
            ")",
            "Lch/qos/logback/core/pattern/CompositeConverter",
            "<TE;>;"
        }
    .end annotation

    const/4 v4, 0x0

    invoke-virtual {p1}, Lch/qos/logback/core/pattern/parser/CompositeNode;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/Compiler;->converterMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_47

    :try_start_11
    const-class v3, Lch/qos/logback/core/pattern/CompositeConverter;

    iget-object v5, p0, Lch/qos/logback/core/pattern/parser/Compiler;->context:Lch/qos/logback/core/Context;

    invoke-static {v2, v3, v5}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Lch/qos/logback/core/Context;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lch/qos/logback/core/pattern/CompositeConverter;

    move-object v1, v0
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1d} :catch_1e

    :goto_1d
    return-object v1

    :catch_1e
    move-exception v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to instantiate converter class ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "] as a composite converter for keyword ["

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lch/qos/logback/core/pattern/parser/Compiler;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v1, v4

    goto :goto_1d

    :cond_47
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "There is no conversion class registered for composite conversion word ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/pattern/parser/Compiler;->addError(Ljava/lang/String;)V

    move-object v1, v4

    goto :goto_1d
.end method

.method createConverter(Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;)Lch/qos/logback/core/pattern/DynamicConverter;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;",
            ")",
            "Lch/qos/logback/core/pattern/DynamicConverter",
            "<TE;>;"
        }
    .end annotation

    const/4 v4, 0x0

    invoke-virtual {p1}, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/Compiler;->converterMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_47

    :try_start_11
    const-class v3, Lch/qos/logback/core/pattern/DynamicConverter;

    iget-object v5, p0, Lch/qos/logback/core/pattern/parser/Compiler;->context:Lch/qos/logback/core/Context;

    invoke-static {v2, v3, v5}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Lch/qos/logback/core/Context;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lch/qos/logback/core/pattern/DynamicConverter;

    move-object v1, v0
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1d} :catch_1e

    :goto_1d
    return-object v1

    :catch_1e
    move-exception v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to instantiate converter class ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "] for keyword ["

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lch/qos/logback/core/pattern/parser/Compiler;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v1, v4

    goto :goto_1d

    :cond_47
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "There is no conversion class registered for conversion word ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/pattern/parser/Compiler;->addError(Ljava/lang/String;)V

    move-object v1, v4

    goto :goto_1d
.end method
