function getNodeName(e){return isNode(e)?(e.nodeName||"").toLowerCase():"#document"}function getWindow(e){var t;return(e==null||(t=e.ownerDocument)==null?void 0:t.defaultView)||window}function getDocumentElement(e){var t;return(t=(isNode(e)?e.ownerDocument:e.document)||window.document)==null?void 0:t.documentElement}function isNode(e){return e instanceof Node||e instanceof getWindow(e).Node}function isElement(e){return e instanceof Element||e instanceof getWindow(e).Element}function isHTMLElement(e){return e instanceof HTMLElement||e instanceof getWindow(e).HTMLElement}function isShadowRoot(e){return typeof ShadowRoot!=="undefined"&&(e instanceof ShadowRoot||e instanceof getWindow(e).ShadowRoot)}function isOverflowElement(e){const{overflow:t,overflowX:n,overflowY:o,display:r}=getComputedStyle(e);return/auto|scroll|overlay|hidden|clip/.test(t+o+n)&&!["inline","contents"].includes(r)}function isTableElement(e){return["table","td","th"].includes(getNodeName(e))}function isContainingBlock(e){const t=isWebKit();const n=getComputedStyle(e);return n.transform!=="none"||n.perspective!=="none"||!!n.containerType&&n.containerType!=="normal"||!t&&!!n.backdropFilter&&n.backdropFilter!=="none"||!t&&!!n.filter&&n.filter!=="none"||["transform","perspective","filter"].some((e=>(n.willChange||"").includes(e)))||["paint","layout","strict","content"].some((e=>(n.contain||"").includes(e)))}function getContainingBlock(e){let t=getParentNode(e);while(isHTMLElement(t)&&!isLastTraversableNode(t)){if(isContainingBlock(t))return t;t=getParentNode(t)}return null}function isWebKit(){return!(typeof CSS==="undefined"||!CSS.supports)&&CSS.supports("-webkit-backdrop-filter","none")}function isLastTraversableNode(e){return["html","body","#document"].includes(getNodeName(e))}function getComputedStyle(e){return getWindow(e).getComputedStyle(e)}function getNodeScroll(e){return isElement(e)?{scrollLeft:e.scrollLeft,scrollTop:e.scrollTop}:{scrollLeft:e.pageXOffset,scrollTop:e.pageYOffset}}function getParentNode(e){if(getNodeName(e)==="html")return e;const t=e.assignedSlot||e.parentNode||isShadowRoot(e)&&e.host||getDocumentElement(e);return isShadowRoot(t)?t.host:t}function getNearestOverflowAncestor(e){const t=getParentNode(e);return isLastTraversableNode(t)?e.ownerDocument?e.ownerDocument.body:e.body:isHTMLElement(t)&&isOverflowElement(t)?t:getNearestOverflowAncestor(t)}function getOverflowAncestors(e,t,n){var o;t===void 0&&(t=[]);n===void 0&&(n=true);const r=getNearestOverflowAncestor(e);const i=r===((o=e.ownerDocument)==null?void 0:o.body);const l=getWindow(r);return i?t.concat(l,l.visualViewport||[],isOverflowElement(r)?r:[],l.frameElement&&n?getOverflowAncestors(l.frameElement):[]):t.concat(r,getOverflowAncestors(r,[],n))}export{getComputedStyle,getContainingBlock,getDocumentElement,getNearestOverflowAncestor,getNodeName,getNodeScroll,getOverflowAncestors,getParentNode,getWindow,isContainingBlock,isElement,isHTMLElement,isLastTraversableNode,isNode,isOverflowElement,isShadowRoot,isTableElement,isWebKit};
