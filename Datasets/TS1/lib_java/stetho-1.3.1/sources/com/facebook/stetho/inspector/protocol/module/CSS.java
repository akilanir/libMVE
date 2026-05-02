package com.facebook.stetho.inspector.protocol.module;

import com.facebook.stetho.common.ListUtil;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.elements.Document;
import com.facebook.stetho.inspector.elements.Origin;
import com.facebook.stetho.inspector.elements.StyleAccumulator;
import com.facebook.stetho.inspector.helper.ChromePeerManager;
import com.facebook.stetho.inspector.helper.PeersRegisteredListener;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.json.annotation.JsonProperty;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONObject;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS.class */
public class CSS implements ChromeDevtoolsDomain {
    private final Document mDocument;
    private final ObjectMapper mObjectMapper = new ObjectMapper();
    private final ChromePeerManager mPeerManager = new ChromePeerManager();

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$PseudoIdMatches.class */
    private static class PseudoIdMatches {

        @JsonProperty(required = true)
        public int pseudoId;

        @JsonProperty(required = true)
        public List<RuleMatch> matches = new ArrayList();
    }

    public CSS(Document document) {
        this.mDocument = (Document) Util.throwIfNull(document);
        this.mPeerManager.setListener(new PeerManagerListener());
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getComputedStyleForNode(JsonRpcPeer peer, JSONObject params) {
        final GetComputedStyleForNodeRequest request = (GetComputedStyleForNodeRequest) this.mObjectMapper.convertValue(params, GetComputedStyleForNodeRequest.class);
        final GetComputedStyleForNodeResult result = new GetComputedStyleForNodeResult();
        result.computedStyle = new ArrayList();
        this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.1
            @Override // java.lang.Runnable
            public void run() {
                Object element = CSS.this.mDocument.getElementForNodeId(request.nodeId);
                if (element != null) {
                    CSS.this.mDocument.getElementStyles(element, new StyleAccumulator() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.1.1
                        @Override // com.facebook.stetho.inspector.elements.StyleAccumulator
                        public void store(String name, String value, boolean isDefault) {
                            if (!isDefault) {
                                CSSComputedStyleProperty property = new CSSComputedStyleProperty();
                                property.name = name;
                                property.value = value;
                                result.computedStyle.add(property);
                            }
                        }
                    });
                } else {
                    LogUtil.e("Tried to get the style of an element that does not exist, using nodeid=" + request.nodeId);
                }
            }
        });
        return result;
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getMatchedStylesForNode(JsonRpcPeer peer, JSONObject params) {
        final GetMatchedStylesForNodeRequest request = (GetMatchedStylesForNodeRequest) this.mObjectMapper.convertValue(params, GetMatchedStylesForNodeRequest.class);
        GetMatchedStylesForNodeResult result = new GetMatchedStylesForNodeResult();
        final RuleMatch match = new RuleMatch();
        result.matchedCSSRules = ListUtil.newImmutableList(match);
        match.matchingSelectors = ListUtil.newImmutableList(0);
        Selector selector = new Selector();
        selector.value = "<this_element>";
        CSSRule rule = new CSSRule();
        rule.origin = Origin.REGULAR;
        rule.selectorList = new SelectorList();
        rule.selectorList.selectors = ListUtil.newImmutableList(selector);
        rule.style = new CSSStyle();
        rule.style.cssProperties = new ArrayList();
        match.rule = rule;
        rule.style.shorthandEntries = Collections.emptyList();
        this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.2
            @Override // java.lang.Runnable
            public void run() {
                Object elementForNodeId = CSS.this.mDocument.getElementForNodeId(request.nodeId);
                if (elementForNodeId != null) {
                    CSS.this.mDocument.getElementStyles(elementForNodeId, new StyleAccumulator() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.2.1
                        @Override // com.facebook.stetho.inspector.elements.StyleAccumulator
                        public void store(String name, String value, boolean isDefault) {
                            if (!isDefault) {
                                CSSProperty property = new CSSProperty();
                                property.name = name;
                                property.value = value;
                                match.rule.style.cssProperties.add(property);
                            }
                        }
                    });
                } else {
                    LogUtil.w("Failed to get style of an element that does not exist, nodeid=" + request.nodeId);
                }
            }
        });
        result.inherited = Collections.emptyList();
        result.pseudoElements = Collections.emptyList();
        return result;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$PeerManagerListener.class */
    private final class PeerManagerListener extends PeersRegisteredListener {
        private PeerManagerListener() {
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onFirstPeerRegistered() {
            CSS.this.mDocument.addRef();
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onLastPeerUnregistered() {
            CSS.this.mDocument.release();
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$CSSComputedStyleProperty.class */
    private static class CSSComputedStyleProperty {

        @JsonProperty(required = true)
        public String name;

        @JsonProperty(required = true)
        public String value;

        private CSSComputedStyleProperty() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$RuleMatch.class */
    private static class RuleMatch {

        @JsonProperty
        public CSSRule rule;

        @JsonProperty
        public List<Integer> matchingSelectors;

        private RuleMatch() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$SelectorList.class */
    private static class SelectorList {

        @JsonProperty
        public List<Selector> selectors;

        @JsonProperty
        public String text;

        private SelectorList() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$SourceRange.class */
    private static class SourceRange {

        @JsonProperty(required = true)
        public int startLine;

        @JsonProperty(required = true)
        public int startColumn;

        @JsonProperty(required = true)
        public int endLine;

        @JsonProperty(required = true)
        public int endColumn;

        private SourceRange() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$Selector.class */
    private static class Selector {

        @JsonProperty(required = true)
        public String value;

        @JsonProperty
        public SourceRange range;

        private Selector() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$CSSRule.class */
    private static class CSSRule {

        @JsonProperty
        public String styleSheetId;

        @JsonProperty(required = true)
        public SelectorList selectorList;

        @JsonProperty
        public Origin origin;

        @JsonProperty
        public CSSStyle style;

        private CSSRule() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$CSSStyle.class */
    private static class CSSStyle {

        @JsonProperty
        public String styleSheetId;

        @JsonProperty(required = true)
        public List<CSSProperty> cssProperties;

        @JsonProperty
        public List<ShorthandEntry> shorthandEntries;

        @JsonProperty
        public String cssText;

        @JsonProperty
        public SourceRange range;

        private CSSStyle() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$ShorthandEntry.class */
    private static class ShorthandEntry {

        @JsonProperty(required = true)
        public String name;

        @JsonProperty(required = true)
        public String value;

        @JsonProperty
        public Boolean imporant;

        private ShorthandEntry() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$CSSProperty.class */
    private static class CSSProperty {

        @JsonProperty(required = true)
        public String name;

        @JsonProperty(required = true)
        public String value;

        @JsonProperty
        public Boolean important;

        @JsonProperty
        public Boolean implicit;

        @JsonProperty
        public String text;

        @JsonProperty
        public Boolean parsedOk;

        @JsonProperty
        public Boolean disabled;

        @JsonProperty
        public SourceRange range;

        private CSSProperty() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeRequest.class */
    private static class GetComputedStyleForNodeRequest {

        @JsonProperty(required = true)
        public int nodeId;

        private GetComputedStyleForNodeRequest() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$InheritedStyleEntry.class */
    private static class InheritedStyleEntry {

        @JsonProperty(required = true)
        public CSSStyle inlineStyle;

        @JsonProperty(required = true)
        public List<RuleMatch> matchedCSSRules;

        private InheritedStyleEntry() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeResult.class */
    private static class GetComputedStyleForNodeResult implements JsonRpcResult {

        @JsonProperty(required = true)
        public List<CSSComputedStyleProperty> computedStyle;

        private GetComputedStyleForNodeResult() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeRequest.class */
    private static class GetMatchedStylesForNodeRequest implements JsonRpcResult {

        @JsonProperty(required = true)
        public int nodeId;

        @JsonProperty
        public Boolean excludePseudo;

        @JsonProperty
        public Boolean excludeInherited;

        private GetMatchedStylesForNodeRequest() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult.class */
    private static class GetMatchedStylesForNodeResult implements JsonRpcResult {

        @JsonProperty
        public List<RuleMatch> matchedCSSRules;

        @JsonProperty
        public List<PseudoIdMatches> pseudoElements;

        @JsonProperty
        public List<InheritedStyleEntry> inherited;

        private GetMatchedStylesForNodeResult() {
        }
    }
}
