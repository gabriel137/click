const ShortLinkTable = {
    mounted() {
      this.handleEvent('short_link_deleted', ({ id }) => {
        this.el.querySelector(`#short_link-${id}`).remove();
      });
    },
  };
  
export default ShortLinkTable;