.class public Lch/qos/logback/classic/PatternLayout;
.super Lch/qos/logback/core/pattern/PatternLayoutBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/pattern/PatternLayoutBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# static fields
.field public static final defaultConverterMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    sget-object v1, Lch/qos/logback/core/pattern/parser/Parser;->DEFAULT_COMPOSITE_CONVERTER_MAP:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "d"

    const-class v2, Lch/qos/logback/classic/pattern/DateConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "date"

    const-class v2, Lch/qos/logback/classic/pattern/DateConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "r"

    const-class v2, Lch/qos/logback/classic/pattern/RelativeTimeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "relative"

    const-class v2, Lch/qos/logback/classic/pattern/RelativeTimeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "level"

    const-class v2, Lch/qos/logback/classic/pattern/LevelConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "le"

    const-class v2, Lch/qos/logback/classic/pattern/LevelConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "p"

    const-class v2, Lch/qos/logback/classic/pattern/LevelConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "t"

    const-class v2, Lch/qos/logback/classic/pattern/ThreadConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "thread"

    const-class v2, Lch/qos/logback/classic/pattern/ThreadConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "lo"

    const-class v2, Lch/qos/logback/classic/pattern/LoggerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "logger"

    const-class v2, Lch/qos/logback/classic/pattern/LoggerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "c"

    const-class v2, Lch/qos/logback/classic/pattern/LoggerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "m"

    const-class v2, Lch/qos/logback/classic/pattern/MessageConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "msg"

    const-class v2, Lch/qos/logback/classic/pattern/MessageConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "message"

    const-class v2, Lch/qos/logback/classic/pattern/MessageConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "C"

    const-class v2, Lch/qos/logback/classic/pattern/ClassOfCallerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "class"

    const-class v2, Lch/qos/logback/classic/pattern/ClassOfCallerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "M"

    const-class v2, Lch/qos/logback/classic/pattern/MethodOfCallerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "method"

    const-class v2, Lch/qos/logback/classic/pattern/MethodOfCallerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "L"

    const-class v2, Lch/qos/logback/classic/pattern/LineOfCallerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "line"

    const-class v2, Lch/qos/logback/classic/pattern/LineOfCallerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "F"

    const-class v2, Lch/qos/logback/classic/pattern/FileOfCallerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "file"

    const-class v2, Lch/qos/logback/classic/pattern/FileOfCallerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "X"

    const-class v2, Lch/qos/logback/classic/pattern/MDCConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "mdc"

    const-class v2, Lch/qos/logback/classic/pattern/MDCConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "ex"

    const-class v2, Lch/qos/logback/classic/pattern/ThrowableProxyConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "exception"

    const-class v2, Lch/qos/logback/classic/pattern/ThrowableProxyConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "rEx"

    const-class v2, Lch/qos/logback/classic/pattern/RootCauseFirstThrowableProxyConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "rootException"

    const-class v2, Lch/qos/logback/classic/pattern/RootCauseFirstThrowableProxyConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "throwable"

    const-class v2, Lch/qos/logback/classic/pattern/ThrowableProxyConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "xEx"

    const-class v2, Lch/qos/logback/classic/pattern/ExtendedThrowableProxyConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "xException"

    const-class v2, Lch/qos/logback/classic/pattern/ExtendedThrowableProxyConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "xThrowable"

    const-class v2, Lch/qos/logback/classic/pattern/ExtendedThrowableProxyConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "nopex"

    const-class v2, Lch/qos/logback/classic/pattern/NopThrowableInformationConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "nopexception"

    const-class v2, Lch/qos/logback/classic/pattern/NopThrowableInformationConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "cn"

    const-class v2, Lch/qos/logback/classic/pattern/ContextNameConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "contextName"

    const-class v2, Lch/qos/logback/classic/pattern/ContextNameConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "caller"

    const-class v2, Lch/qos/logback/classic/pattern/CallerDataConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "marker"

    const-class v2, Lch/qos/logback/classic/pattern/MarkerConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "property"

    const-class v2, Lch/qos/logback/classic/pattern/PropertyConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "n"

    const-class v2, Lch/qos/logback/classic/pattern/LineSeparatorConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "black"

    const-class v2, Lch/qos/logback/core/pattern/color/BlackCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "red"

    const-class v2, Lch/qos/logback/core/pattern/color/RedCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "green"

    const-class v2, Lch/qos/logback/core/pattern/color/GreenCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "yellow"

    const-class v2, Lch/qos/logback/core/pattern/color/YellowCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "blue"

    const-class v2, Lch/qos/logback/core/pattern/color/BlueCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "magenta"

    const-class v2, Lch/qos/logback/core/pattern/color/MagentaCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "cyan"

    const-class v2, Lch/qos/logback/core/pattern/color/CyanCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "white"

    const-class v2, Lch/qos/logback/core/pattern/color/WhiteCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "gray"

    const-class v2, Lch/qos/logback/core/pattern/color/GrayCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "boldRed"

    const-class v2, Lch/qos/logback/core/pattern/color/BoldRedCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "boldGreen"

    const-class v2, Lch/qos/logback/core/pattern/color/BoldGreenCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "boldYellow"

    const-class v2, Lch/qos/logback/core/pattern/color/BoldYellowCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "boldBlue"

    const-class v2, Lch/qos/logback/core/pattern/color/BoldBlueCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "boldMagenta"

    const-class v2, Lch/qos/logback/core/pattern/color/BoldMagentaCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "boldCyan"

    const-class v2, Lch/qos/logback/core/pattern/color/BoldCyanCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "boldWhite"

    const-class v2, Lch/qos/logback/core/pattern/color/BoldWhiteCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "highlight"

    const-class v2, Lch/qos/logback/classic/pattern/color/HighlightingCompositeConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    const-string v1, "lsn"

    const-class v2, Lch/qos/logback/classic/pattern/LocalSequenceNumberConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/pattern/PatternLayoutBase;-><init>()V

    new-instance v0, Lch/qos/logback/classic/pattern/EnsureExceptionHandling;

    invoke-direct {v0}, Lch/qos/logback/classic/pattern/EnsureExceptionHandling;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/PatternLayout;->postCompileProcessor:Lch/qos/logback/core/pattern/PostCompileProcessor;

    return-void
.end method


# virtual methods
.method public doLayout(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Lch/qos/logback/classic/PatternLayout;->isStarted()Z

    move-result v0

    if-nez v0, :cond_9

    const-string v0, ""

    :goto_8
    return-object v0

    :cond_9
    invoke-virtual {p0, p1}, Lch/qos/logback/classic/PatternLayout;->writeLoopOnConverters(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method

.method public bridge synthetic doLayout(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/PatternLayout;->doLayout(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultConverterMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    return-object v0
.end method
