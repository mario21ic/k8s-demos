import kopf
import logging

@kopf.on.create("crds.albertcoronado.com", "v1", "albertcrd")
def create_fn(spec, **kwargs):
    logging.info("Created.")
    logging.info(spec)
    logging.info(kwargs)

@kopf.on.update("crds.albertcoronado.com", "v1", "albertcrd")
def update_fn(spec, **kwargs):
    logging.info("Update.")
    logging.info(spec)
    logging.info(kwargs)

@kopf.on.delete("crds.albertcoronado.com", "v1", "albertcrd")
def delete_fn(spec, **kwargs):
    logging.info("Delete.")
    logging.info(spec)
    logging.info(kwargs)

